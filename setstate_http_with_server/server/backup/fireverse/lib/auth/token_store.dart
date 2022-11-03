abstract class FireDartTokenStore {
  FireDartToken? _token;

  String? get userId => _token?._userId;

  String? get idToken => _token?._idToken;

  String? get refreshToken => _token?._refreshToken;

  DateTime? get expiry => _token?._expiry;

  bool get hasToken => _token != null;

  void setToken(
      String userId, String idToken, String refreshToken, int expiresIn) {
    var expiry = DateTime.now().add(Duration(seconds: expiresIn));
    _token = FireDartToken(userId, idToken, refreshToken, expiry);
    write(_token);
  }

  FireDartTokenStore() {
    _token = read();
  }

  /// Force refresh - useful for testing
  void expireToken() {
    assert(_token != null);
    _token = FireDartToken(_token!._userId, _token!._idToken,
        _token!._refreshToken, DateTime.now());
    write(_token);
  }

  void clear() {
    _token = null;
    delete();
  }

  /// Restore the refresh token from storage, returns null if token isn't stored
  FireDartToken? read();

  /// Persist the refresh token
  void write(FireDartToken? token);

  void delete();
}

/// Doesn't actually persist tokens. Useful for testing or in environments where
/// persistence isn't available but it's fine signing in for each session.
class FireDartVolatileStore extends FireDartTokenStore {
  @override
  FireDartToken? read() => null;

  @override
  void write(FireDartToken? token) {}

  @override
  void delete() {}
}

class FireDartToken {
  final String _userId;
  final String _idToken;
  final String _refreshToken;
  final DateTime _expiry;

  FireDartToken(this._userId, this._idToken, this._refreshToken, this._expiry);

  FireDartToken.fromMap(Map<String, dynamic> map)
      : this(
          map['userId'],
          map['idToken'],
          map['refreshToken'],
          DateTime.parse(map['expiry']),
        );

  Map<String, dynamic> toMap() => {
        'userId': _userId,
        'idToken': _idToken,
        'refreshToken': _refreshToken,
        'expiry': _expiry.toIso8601String(),
      };
}
