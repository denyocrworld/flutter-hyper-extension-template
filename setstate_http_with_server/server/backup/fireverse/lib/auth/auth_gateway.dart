import 'dart:convert';

import 'package:fireverse/auth/client.dart';
import 'package:fireverse/auth/token_provider.dart';

import 'exceptions.dart';
import 'user_gateway.dart';

class FireDartAuthGateway {
  final FireDartKeyClient client;
  final FireDartTokenProvider tokenProvider;

  FireDartAuthGateway(this.client, this.tokenProvider);

  Future<FireDartUser> signUp(String email, String password) async =>
      _auth('signUp', {'email': email, 'password': password});

  Future<FireDartUser> signIn(String email, String password) async =>
      _auth('signInWithPassword', {'email': email, 'password': password});

  Future<FireDartUser> signInAnonymously() async => _auth('signUp', {});

  Future<void> resetPassword(String email) => _post('sendOobCode', {
        'requestType': 'PASSWORD_RESET',
        'email': email,
      });

  Future<FireDartUser> _auth(String method, Map<String, String> payload) async {
    var body = {
      ...payload,
      'returnSecureToken': 'true',
    };

    var map = await _post(method, body);
    tokenProvider.setToken(map);
    return FireDartUser.fromMap(map);
  }

  Future<Map<String, dynamic>> _post(
      String method, Map<String, String> body) async {
    var requestUrl =
        'https://identitytoolkit.googleapis.com/v1/accounts:$method';

    var response = await client.post(
      Uri.parse(requestUrl),
      body: body,
    );

    if (response.statusCode != 200) {
      throw FireDartAuthException(response.body);
    }

    return json.decode(response.body);
  }
}
