import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});

  /* reference for collection */

  // go to following collection or create one if unavailable

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection("groups");

  /* save user data */

  Future saveUserData(String fullname, String email) async {
    return await userCollection.doc(uid).set({
      "fullname": fullname,
      "email": email,
      "groups": [],
      "pfp": "",
      "uid": uid,
    });
  }

  /* get user data */
  Future getUserData(String email) async {
    QuerySnapshot snapshot = await userCollection
        .where("email", isEqualTo: email)
        .get(); // snapshot of collection where email
    return snapshot;  // return snapshot
  }
}
