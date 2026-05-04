import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class LogoutService {
  Future<void> logOut({required String userId}) async {
    final _auth = FirebaseAuth.instance;
    try {
      await _auth.signOut();
      log('logged out successfully');
    } catch (e) {
      log('Exception caught while logged out $e');
      rethrow;
    }
  }
}
