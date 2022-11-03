import 'dart:convert';

import 'package:fireverse/auth/client.dart';
import 'package:fireverse/auth/token_provider.dart';

class FireDartUserGateway {
  final FireDartUserClient _client;

  FireDartUserGateway(
      FireDartKeyClient client, FireDartTokenProvider tokenProvider)
      : _client = FireDartUserClient(client, tokenProvider);

  Future<void> requestEmailVerification() =>
      _post('sendOobCode', {'requestType': 'VERIFY_EMAIL'});

  Future<FireDartUser> getUser() async {
    var map = await _post('lookup', {});
    return FireDartUser.fromMap(map['users'][0]);
  }

  Future<void> changePassword(String password) async {
    await _post('update', {
      'password': password,
    });
  }

  Future<void> updateProfile(String? displayName, String? photoUrl) async {
    assert(displayName != null || photoUrl != null);
    await _post('update', {
      if (displayName != null) 'displayName': displayName,
      if (photoUrl != null) 'photoUrl': photoUrl,
    });
  }

  Future<void> deleteAccount() async {
    await _post('delete', {});
  }

  Future<Map<String, dynamic>> _post<T>(
      String method, Map<String, String> body) async {
    var requestUrl =
        'https://identitytoolkit.googleapis.com/v1/accounts:$method';

    var response = await _client.post(
      Uri.parse(requestUrl),
      body: body,
    );

    return json.decode(response.body);
  }
}

class FireDartUser {
  final String id;
  final String? displayName;
  final String? photoUrl;
  final String? email;
  final bool? emailVerified;

  FireDartUser.fromMap(Map<String, dynamic> map)
      : id = map['localId'],
        displayName = map['displayName'],
        photoUrl = map['photoUrl'],
        email = map['email'],
        emailVerified = map['emailVerified'];

  Map<String, dynamic> toMap() => {
        'localId': id,
        'displayName': displayName,
        'photoUrl': photoUrl,
        'email': email,
        'emailVerified': emailVerified,
      };

  @override
  String toString() => toMap().toString();
}
