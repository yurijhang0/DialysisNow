import 'package:firebase_auth/firebase_auth.dart';
import 'package:fryo/src/models/MyUser.dart';
import 'package:fryo/src/services/DatabaseService.dart';

class AuthService {

  final FirebaseAuth auth = FirebaseAuth.instance;

  // create user object based on FirebaseUser
  MyUser userFromFirebaseUser(User user) {
    if (user != null) {
      return MyUser(uid: user.uid);
    } else {
      return null;
    }
  }

  // auth change user stream
  Stream<MyUser> get user {
    return auth.authStateChanges()
        .map((User user) => userFromFirebaseUser(user));
  }

  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await auth.signInAnonymously();
      User user = result.user;
      return userFromFirebaseUser(user);
    } catch(e) {
        print(e.toString());
        return null;
      }
    }

  // sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }


  // register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;

      // create a new document for the user with the uid
      await DatabaseService().updateUserData('ID', false, false, false, false, false, 'addInfo');
      return userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
/*  Future signOut() aysnc {
    try {
      return await auth.signOut();
  } catch(e) {
      print(e.toString());
      return null;
  }
}*/

  }