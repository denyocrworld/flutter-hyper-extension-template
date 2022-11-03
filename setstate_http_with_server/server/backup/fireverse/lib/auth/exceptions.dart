import 'dart:convert';

class FireDartAuthException implements Exception {
  final String body;

  String get message => jsonDecode(body)['error']['message'];

  String get errorCode => message.split(' ')[0];

  FireDartAuthException(this.body);

  @override
  String toString() => 'AuthException: $errorCode';
}

class FireDartSignedOutException implements Exception {
  @override
  String toString() =>
      'SignedOutException: Attempted to call a protected resource while signed out';
}
