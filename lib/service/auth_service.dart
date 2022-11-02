import 'package:firebase_auth/firebase_auth.dart';
import 'package:groupie/helper/helper_function.dart';
import 'package:groupie/service/database_service.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  /* login */
  Future loginWithEmailandPassword(String email, String password) async {
    try {
      // register user
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        // call database service to update user data
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      return e.message;
    }
  }

  /* register */
  Future registerUserWithEmailandPassword(
      String fullname, String email, String password) async {
    try {
      // register user
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        // call database service to update user data
        await DatabaseService(uid: user.uid).saveUserData(fullname, email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      return e.message;
    }
  }

  // signout
  Future signOut() async {
    try {
      await HelperFunctions.saveUserLoggedInStatus(
          false); // user is not logged in
      await HelperFunctions.saveUserEmailSF(""); // user is not logged in
      await HelperFunctions.saveUserNameSF(""); // user is not logged in
      await firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}
