import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> signingWithEmail(String email, String password) async {
    UserCredential _cred = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return _cred.user;
  }

  logout() {
    _auth.signOut();
  }

  Stream<User> authStateChanges() {
    return FirebaseAuth.instance.authStateChanges();
  }
}
