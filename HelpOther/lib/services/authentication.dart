
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helpother/models/user.dart';
import 'package:helpother/services/database.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  AppUser? _userFromFirebaseUser(User? user) {
    return user != null ? AppUser(user.uid) : null;
  }

  Stream<AppUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result =
        await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String name, String email, String password) async {
    try {
      UserCredential result =
        await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      user?.updateProfile(displayName: name);
      if (user == null) {
        throw Exception("No user found");
      } else {
        await DatabaseService(user.uid).saveUser(name,email,'eleve',50);

        return _userFromFirebaseUser(user);
      }
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }
}
