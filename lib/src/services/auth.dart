import 'package:firebase_auth/firebase_auth.dart';
import 'package:fryo/src/models/user.dart';

class AuthService {

  final FirebaseAuth auth = FirebaseAuth.instance;

  // create user object based on FirebaseUser
  User? userFromFirebaseUser(User user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await auth.signInAnonymously();
      User? user = result.user;
      return userFromFirebaseUser(user!);
    } catch(e) {
        print(e.toString());
        return null;
      }
    }




  }