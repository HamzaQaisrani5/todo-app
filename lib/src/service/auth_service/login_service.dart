import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class LoginService {
  final _firebaseAuth = FirebaseAuth.instance;
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      log('*** user Logged in ***');
    } catch (e) {
      log('*** Error caught when logging in ***');
      rethrow;
    }
  }
}
