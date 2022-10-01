import 'package:fhe_template/core.dart';
import 'package:fhe_template/service/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import 'package:google_sign_in/google_sign_in.dart';

class WelcomeController extends State<WelcomeView> implements MvcController {
  static late WelcomeController instance;
  late WelcomeView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  doLogin() async {
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      await googleSignIn.disconnect();
    } catch (_) {}

    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      var userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      debugPrint("userCredential: userCredential");
      //TODO: on login success
      //------------------

      await UserService.doSaveUserData();

      Get.offAll(const MainNavigationView());
    } catch (_) {}
  }
}
//SHA-1
/*
cd android
./gradlew signinReport
*/
