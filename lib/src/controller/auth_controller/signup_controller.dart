import 'package:app_bottom_bar/src/service/auth_service/signup_service.dart';
import 'package:app_bottom_bar/src/states/auth_states/signup_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/legacy.dart';

class SignupController extends StateNotifier<SignupState> {
  final SignupService _signupService = SignupService();
  SignupController() : super(SignupInitial());

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = SignupLoading();
    try {
      await _signupService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      state = SignupSuccess('Login Succesfull');
    } catch (e) {
      if (e is FirebaseAuthException) {
        state = SignupError(e.message!);
      }
    }
  }
}
