import 'package:firebase_auth/firebase_auth.dart';
import 'package:groupie/service/database_service.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // login

  // register
  Future registerUserWithEmailandPassword(
      String fullname, String email, String password) async {
    try {
      // register user
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        // call database service to update user data
        await DatabaseService(uid: user.uid).updateUserData(fullname, email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      return e.message;
    }
  }

  // signout
}
