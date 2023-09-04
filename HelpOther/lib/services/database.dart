import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helpother/models/user.dart';


class DatabaseService {
  final String uid;

  DatabaseService(this.uid);

  final CollectionReference<Map<String, dynamic>> userCollection =
  FirebaseFirestore.instance.collection("users");

  Future<void> saveUser(String Name, String email) async {
    return await userCollection.doc(uid).set({'Name': Name, 'email': email,'uid1': uid});
  }

  AppUserData _userFromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var data = snapshot.data();
    if (data == null) throw Exception("user not found");
    return AppUserData(
      uid: snapshot.id,
      uid1: data['uid'],
      Name: data['name'],
      email: data['email'],
    );
  }

  Stream<AppUserData> get user {
    return userCollection.doc(uid).snapshots().map(_userFromSnapshot);
  }

  List<AppUserData> _userListFromSnapshot(QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.map((doc) {
      return _userFromSnapshot(doc);
    }).toList();
  }

  Stream<List<AppUserData>> get users {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }
}