import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  User? _user;
  User? get user => _user;

  AuthService() {
    _user = FirebaseAuth.instance.currentUser;
  }

  Future<bool> register(String email, String password) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return true;
    } on FirebaseAuthException catch (e) {
      print(e.code.toString());
    } catch (e) {
      print(e.toString());
    }
    return false;
  }

  Future<bool> login(String email, String password) async {  
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);    
      if (user.user != null) return true;
    } on FirebaseAuthException catch (e) {
      print(e.code.toString());
      return false;
    }
    return false;
  }

  Future<void> logout(User? currentUser) async {
    await FirebaseAuth.instance.signOut();
  }
}