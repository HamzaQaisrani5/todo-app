import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  final FirebaseAuth _auth;

  AuthRepository(this._auth);

  //   sign in
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      log('Exception caught while signing in: $e');
      rethrow;
    }
  }

  // sign up
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      log('Exception caught while signing up: $e');
      rethrow;
    }
  }

  // User
  User? get currentUser {
    return _auth.currentUser;
  }

  //   Stream

  Stream<User?> authStateChanges() {
    return _auth.authStateChanges();
  }

  // sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log('Exception caught while signing out: $e');
      rethrow;
    }
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return AuthRepository(FirebaseAuth.instance);
}

@Riverpod(keepAlive: true)
Stream<User?> authStateChanges(Ref ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
}

@Riverpod(keepAlive: true)
User? currentUser(Ref ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.currentUser;
}
