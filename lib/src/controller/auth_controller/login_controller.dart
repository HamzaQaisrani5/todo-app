import 'dart:developer';

import 'package:app_bottom_bar/src/service/auth_service/login_service.dart';
import 'package:app_bottom_bar/src/states/auth_states/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod/legacy.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController() : super(LoginInitial());
  final _logInService = LoginService();
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = LoginLoading();
    try {
      await _logInService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      state = LoginSuccess('Signed in Successfully');
    } catch (e) {
      if (e is FirebaseAuthException) {
        state = LoginError(e.message!);
      }
    }
  }
}
