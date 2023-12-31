import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helpother/models/user.dart';


class DatabaseService {
  final String uid;

  DatabaseService(this.uid);

  final CollectionReference<Map<String, dynamic>> userCollection =
    FirebaseFirestore.instance.collection("users");

  Future<void> saveUser(String name, String email,String role,int HelpCoin) async {
    return await userCollection.doc(uid).set({'name': name, 'email': email,'role':role,'helpcoin':HelpCoin});
  }

  Future<void> saveToken(String? token) async {
    return await userCollection.doc(uid).update({'token': token});
  }

  AppUserData _userFromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var data = snapshot.data();
    if (data == null) throw Exception("user not found");
    return AppUserData(
      uid: uid,
      name: data['name'],
      email: data['email'],
      role : data['role']
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