import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class SignupService {
  final _firebaseAuth = FirebaseAuth.instance;
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      log('*** User Created ***');
    } catch (e) {
      log('*** User not created successfully *** $e');
      rethrow;
    }
  }
}
