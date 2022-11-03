import 'dart:async';

import 'package:fireverse/generated/google/firestore/v1/common.pb.dart';
import 'package:fireverse/generated/google/firestore/v1/document.pb.dart' as fs;
import 'package:fireverse/generated/google/firestore/v1/firestore.pbgrpc.dart';
import 'package:fireverse/generated/google/firestore/v1/query.pb.dart';
import 'package:grpc/grpc.dart';

import '../fireverse.dart';
import 'token_authenticator.dart';

class FireDartFirestoreGatewayStreamCache {
  void Function(String userInfo)? onDone;
  String userInfo;
  void Function(Object e) onError;

  StreamController<ListenRequest>? _listenRequestStreamController;
  late StreamController<ListenResponse> _listenResponseStreamController;
  late Map<String, FireDartDocument> _documentMap;

  late bool _shouldCleanup;

  Stream<ListenResponse> get stream => _listenResponseStreamController.stream;

  Map<String, FireDartDocument> get documentMap => _documentMap;

  FireDartFirestoreGatewayStreamCache(
      {this.onDone, required this.userInfo, Function(Object e)? onError})
      : onError = onError ?? _handleErrorStub;

  void setListenRequest(
      ListenRequest request, FirestoreClient client, String database) {
    print("setListenRequest:");
    // Close the request stream if this function is called for a second time;
    _listenRequestStreamController?.close();

    _documentMap = <String, FireDartDocument>{};
    _listenRequestStreamController = StreamController<ListenRequest>();
    _listenResponseStreamController =
        StreamController<ListenResponse>.broadcast(
            onListen: _handleListenOnResponseStream,
            onCancel: _handleCancelOnResponseStream);
    _listenResponseStreamController.addStream(client
        .listen(_listenRequestStreamController!.stream,
            options: CallOptions(
                metadata: {'google-cloud-resource-prefix': database}))
        .handleError(onError));
    _listenRequestStreamController!.add(request);
  }

  void _handleListenOnResponseStream() {
    _shouldCleanup = false;
  }

  void _handleCancelOnResponseStream() {
    // Clean this up in the future
    _shouldCleanup = true;
    Future.microtask(_handleDone);
  }

  void _handleDone() {
    if (!_shouldCleanup) {
      return;
    }
    onDone?.call(userInfo);
    // Clean up stream resources
    _listenRequestStreamController!.close();
  }

  static void _handleErrorStub(e) {
    throw e;
  }
}

class FireDartFirestoreGateway {
  final FireDartFirebaseAuth? auth;
  final String database;

  final Map<String, FireDartFirestoreGatewayStreamCache>
      _listenRequestStreamMap;

  late FirestoreClient _client;

  FireDartFirestoreGateway(String projectId, {String? databaseId, this.auth})
      : database =
            'projects/$projectId/databases/${databaseId ?? '(default)'}/documents',
        _listenRequestStreamMap =
            <String, FireDartFirestoreGatewayStreamCache>{} {
    _setupClient();
  }

  Future<FireDartPage<FireDartDocument>> getCollection(
      String path, int pageSize, String nextPageToken) async {
    var request = ListDocumentsRequest()
      ..parent = path.substring(0, path.lastIndexOf('/'))
      ..collectionId = path.substring(path.lastIndexOf('/') + 1)
      ..pageSize = pageSize
      ..pageToken = nextPageToken;
    var response =
        await _client.listDocuments(request).catchError(_handleError);
    var documents = response.documents
        .map((rawDocument) => FireDartDocument(this, rawDocument));
    return FireDartPage(documents, response.nextPageToken);
  }

  Stream<List<FireDartDocument>> streamCollection(String path) {
    print("streamCollection: path > $path");
    // ! NOTES: This part causes streams in windows to not work if there is more than 1 instance on different pages. So, I disabled it.
    // if (_listenRequestStreamMap.containsKey(path)) {
    //   print("You are here?");
    //   return _mapCollectionStream(_listenRequestStreamMap[path]!);
    // }

    var selector = StructuredQuery_CollectionSelector()
      ..collectionId = path.substring(path.lastIndexOf('/') + 1);
    var query = StructuredQuery()..from.add(selector);
    final queryTarget = Target_QueryTarget()
      ..parent = path.substring(0, path.lastIndexOf('/'))
      ..structuredQuery = query;
    final target = Target()..query = queryTarget;
    final request = ListenRequest()
      ..database = database
      ..addTarget = target;

    final listenRequestStream = FireDartFirestoreGatewayStreamCache(
        onDone: _handleDone, userInfo: path, onError: _handleError);
    _listenRequestStreamMap[path] = listenRequestStream;

    listenRequestStream.setListenRequest(request, _client, database);

    return _mapCollectionStream(listenRequestStream);
  }

  Future<FireDartDocument> createDocument(
      String path, String? documentId, fs.Document document) async {
    var split = path.split('/');
    var parent = split.sublist(0, split.length - 1).join('/');
    var collectionId = split.last;

    var request = CreateDocumentRequest()
      ..parent = parent
      ..collectionId = collectionId
      ..documentId = documentId ?? ''
      ..document = document;

    var response =
        await _client.createDocument(request).catchError(_handleError);
    return FireDartDocument(this, response);
  }

  Future<FireDartDocument> getDocument(path) async {
    var rawDocument = await _client
        .getDocument(GetDocumentRequest()..name = path)
        .catchError(_handleError);
    return FireDartDocument(this, rawDocument);
  }

  Future<void> updateDocument(
      String path, fs.Document document, bool update) async {
    document.name = path;

    var request = UpdateDocumentRequest()..document = document;

    if (update) {
      var mask = DocumentMask();
      document.fields.keys.forEach((key) => mask.fieldPaths.add(key));
      request.updateMask = mask;
    }

    await _client.updateDocument(request).catchError(_handleError);
  }

  Future<void> deleteDocument(String path) => _client
      .deleteDocument(DeleteDocumentRequest()..name = path)
      .catchError(_handleError);

  Stream<FireDartDocument?> streamDocument(String path) {
    if (_listenRequestStreamMap.containsKey(path)) {
      return _mapDocumentStream(_listenRequestStreamMap[path]!);
    }

    final documentsTarget = Target_DocumentsTarget()..documents.add(path);
    final target = Target()..documents = documentsTarget;
    final request = ListenRequest()
      ..database = database
      ..addTarget = target;

    final listenRequestStream = FireDartFirestoreGatewayStreamCache(
        onDone: _handleDone, userInfo: path, onError: _handleError);
    _listenRequestStreamMap[path] = listenRequestStream;

    listenRequestStream.setListenRequest(request, _client, database);

    return _mapDocumentStream(listenRequestStream);
  }

  Future<List<FireDartDocument>> runQuery(
      StructuredQuery structuredQuery, String fullPath) async {
    final runQuery = RunQueryRequest()
      ..structuredQuery = structuredQuery
      ..parent = fullPath.substring(0, fullPath.lastIndexOf('/'));
    final response = _client.runQuery(runQuery);
    return await response
        .where((event) => event.hasDocument())
        .map((event) => FireDartDocument(this, event.document))
        .toList();
  }

  void _setupClient() {
    _listenRequestStreamMap.clear();
    _client = FirestoreClient(ClientChannel('firestore.googleapis.com'),
        options: FireDartTokenAuthenticator.from(auth)?.toCallOptions);
  }

  void _handleError(e) {
    print('Handling error $e using FirestoreGateway._handleError');
    if (e is GrpcError &&
        [
          StatusCode.unknown,
          StatusCode.unimplemented,
          StatusCode.internal,
          StatusCode.unavailable,
          StatusCode.unauthenticated,
          StatusCode.dataLoss,
        ].contains(e.code)) {
      _setupClient();
    }
    throw e;
  }

  void _handleDone(String path) {
    _listenRequestStreamMap.remove(path);
  }

  Stream<List<FireDartDocument>> _mapCollectionStream(
      FireDartFirestoreGatewayStreamCache listenRequestStream) {
    return listenRequestStream.stream
        .where((response) =>
            response.hasDocumentChange() ||
            response.hasDocumentRemove() ||
            response.hasDocumentDelete())
        .map((response) {
      if (response.hasDocumentChange()) {
        listenRequestStream.documentMap[response.documentChange.document.name] =
            FireDartDocument(this, response.documentChange.document);
      } else {
        listenRequestStream.documentMap
            .remove(response.documentDelete.document);
      }
      return listenRequestStream.documentMap.values.toList();
    });
  }

  Stream<FireDartDocument?> _mapDocumentStream(
      FireDartFirestoreGatewayStreamCache listenRequestStream) {
    return listenRequestStream.stream
        .where((response) =>
            response.hasDocumentChange() ||
            response.hasDocumentRemove() ||
            response.hasDocumentDelete())
        .map((response) => response.hasDocumentChange()
            ? FireDartDocument(this, response.documentChange.document)
            : null);
  }
}
