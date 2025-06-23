import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  void saveUserEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //print("EMAIL MENTÉSE 2.");
    prefs.setString('useremail', email);
    //print("MENTETT EMAILCÍM: $email");
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException {
      rethrow;
    }
  }


  Future<bool> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException {
      rethrow;
    }
    return true;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('useremail', '');
  }

  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> reauthenticateAndDelete(String email, String password) async{
    try{
      User? user = _firebaseAuth.currentUser;
      if(user != null){
        AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

        // Újrahitelesítés
        await user.reauthenticateWithCredential(credential);

        // Felhasználó törlése
        await user.delete();
      }
    } catch (e){
      print("Hiba történt");
    }
  }
}
