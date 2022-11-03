import 'package:fireverse/auth/auth_gateway.dart';
import 'package:fireverse/auth/client.dart';
import 'package:fireverse/auth/token_provider.dart';
import 'package:fireverse/auth/token_store.dart';
import 'package:fireverse/auth/user_gateway.dart';
import 'package:http/http.dart' as http;

class FireDartFirebaseAuth {
  /* Singleton interface */
  static FireDartFirebaseAuth? _instance;

  static FireDartFirebaseAuth initialize(
      String apiKey, FireDartTokenStore tokenStore) {
    if (_instance != null) {
      throw Exception('FirebaseAuth instance was already initialized');
    }
    _instance = FireDartFirebaseAuth(apiKey, tokenStore);
    return _instance!;
  }

  static FireDartFirebaseAuth get instance {
    if (_instance == null) {
      throw Exception(
          "FirebaseAuth hasn't been initialized. Please call FirebaseAuth.initialize() before using it.");
    }
    return _instance!;
  }

  /* Instance interface */
  final String apiKey;

  http.Client httpClient;
  late FireDartTokenProvider tokenProvider;

  late FireDartAuthGateway _authGateway;
  late FireDartUserGateway _userGateway;

  FireDartFirebaseAuth(this.apiKey, FireDartTokenStore tokenStore,
      {http.Client? httpClient})
      : assert(apiKey.isNotEmpty),
        httpClient = httpClient ?? http.Client() {
    var keyClient = FireDartKeyClient(this.httpClient, apiKey);
    tokenProvider = FireDartTokenProvider(keyClient, tokenStore);

    _authGateway = FireDartAuthGateway(keyClient, tokenProvider);
    _userGateway = FireDartUserGateway(keyClient, tokenProvider);
  }

  bool get isSignedIn => tokenProvider.isSignedIn;

  Stream<bool> get signInState => tokenProvider.signInState;

  String get userId {
    if (!isSignedIn) throw Exception('User signed out');
    return tokenProvider.userId!;
  }

  Future<FireDartUser> signUp(String email, String password) =>
      _authGateway.signUp(email, password);

  Future<FireDartUser> signIn(String email, String password) =>
      _authGateway.signIn(email, password);

  Future<FireDartUser> signInAnonymously() => _authGateway.signInAnonymously();

  void signOut() => tokenProvider.signOut();

  Future<void> resetPassword(String email) => _authGateway.resetPassword(email);

  Future<void> requestEmailVerification() =>
      _userGateway.requestEmailVerification();

  Future<void> changePassword(String password) =>
      _userGateway.changePassword(password);

  Future<FireDartUser> getUser() => _userGateway.getUser();

  Future<void> updateProfile({String? displayName, String? photoUrl}) =>
      _userGateway.updateProfile(displayName, photoUrl);

  Future<void> deleteAccount() async {
    await _userGateway.deleteAccount();
    signOut();
  }
}
