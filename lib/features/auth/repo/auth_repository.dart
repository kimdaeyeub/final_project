import 'package:final_project/features/auth/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool get isLoggedIn => user != null;
  User? get user => _auth.currentUser;

  Future<void> signUp(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> login(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }
}

final authRepo = Provider((ref) => AuthRepository());
