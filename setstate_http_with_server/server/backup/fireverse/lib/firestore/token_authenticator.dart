import 'package:grpc/grpc.dart';

import '../fireverse.dart';

class FireDartTokenAuthenticator {
  final FireDartFirebaseAuth auth;

  FireDartTokenAuthenticator._internal(this.auth);

  static FireDartTokenAuthenticator? from(FireDartFirebaseAuth? auth) =>
      auth != null ? FireDartTokenAuthenticator._internal(auth) : null;

  Future<void> authenticate(Map<String, String> metadata, String uri) async {
    var idToken = await auth.tokenProvider.idToken;
    metadata['authorization'] = 'Bearer $idToken';
  }

  CallOptions get toCallOptions => CallOptions(providers: [authenticate]);
}
