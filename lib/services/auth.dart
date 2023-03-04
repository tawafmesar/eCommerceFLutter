import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase{
    User? get currentUser;
    Stream<User?> authStateChanges();
  Future<User?> loginWitEmailAndPassword(String email , String password);
  Future<User?> signUpWitEmailAndPassword(String email , String password);
    Future<void> logout();

}

class Auth implements AuthBase{
  final _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<User?> loginWitEmailAndPassword(String email , String password) async {
    final userAuth = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return userAuth.user;
  }

  @override
  Future<User?> signUpWitEmailAndPassword(String email , String password) async{
    final userAuth = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return userAuth.user;

  }

  @override
  Stream<User?> authStateChanges() =>_firebaseAuth.authStateChanges();

  @override
  // TODO: implement currentUser
  User? get currentUser => _firebaseAuth.currentUser;

  Future<void> logout() async => await _firebaseAuth.signOut();


}