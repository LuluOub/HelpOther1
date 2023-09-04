
import 'package:cloud_firestore/cloud_firestore.dart';


import '../models/user.dart';

class DatabaseDemande {
  final String uid;

  DatabaseDemande(this.uid);

  final CollectionReference<Map<String, dynamic>> userCollection =
  FirebaseFirestore.instance.collection("demande");

  Future<void> saveUser(String name, String email, String chapitre, String demande) async {
    return await userCollection.doc(uid).set({'name': name, 'email': email,'chapitre' : chapitre,'demande' : demande});

    }



  Demande _userFromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var data = snapshot.data();
    if (data == null) throw Exception("user not found");
    return Demande(
      uid: uid,
      name: data['name'],
      email: data['email'],
      chapitre: data['chapitre'],
      demande: data['demande']
    );
  }
  Stream<Demande> get user {
    return userCollection.doc(uid).snapshots().map(_userFromSnapshot);
  }
  }




