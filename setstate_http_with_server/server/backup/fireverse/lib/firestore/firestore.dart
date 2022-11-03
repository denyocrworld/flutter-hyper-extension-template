import 'package:fireverse/auth/firebase_auth.dart';

import 'firestore_gateway.dart';
import 'models.dart';

class FireDartFirestore {
  /* Singleton interface */
  static FireDartFirestore? _instance;

  static FireDartFirestore initialize(String projectId, {String? databaseId}) {
    if (_instance != null) {
      throw Exception('Firestore instance was already initialized');
    }
    FireDartFirebaseAuth? auth;
    try {
      auth = FireDartFirebaseAuth.instance;
    } catch (e) {
      // FirebaseAuth isn't initialized
    }
    _instance =
        FireDartFirestore(projectId, databaseId: databaseId, auth: auth);
    return _instance!;
  }

  static FireDartFirestore get instance {
    if (_instance == null) {
      throw Exception(
          "Firestore hasn't been initialized. Please call Firestore.initialize() before using it.");
    }
    return _instance!;
  }

  /* Instance interface */
  final FireDartFirestoreGateway _gateway;

  FireDartFirestore(String projectId,
      {String? databaseId, FireDartFirebaseAuth? auth})
      : _gateway = FireDartFirestoreGateway(projectId,
            databaseId: databaseId, auth: auth),
        assert(projectId.isNotEmpty);

  FireDartReference reference(String path) =>
      FireDartReference.create(_gateway, path);

  FireDartCollectionReference collection(String path) =>
      FireDartCollectionReference(_gateway, path);

  FireDartDocumentReference document(String path) =>
      FireDartDocumentReference(_gateway, path);
}
