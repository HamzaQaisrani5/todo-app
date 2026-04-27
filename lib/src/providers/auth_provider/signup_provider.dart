import 'package:app_bottom_bar/src/controller/auth_controller/signup_controller.dart';
import 'package:app_bottom_bar/src/states/auth_states/signup_state.dart';
import 'package:flutter_riverpod/legacy.dart';

final signUpProvider = StateNotifierProvider<SignupController, SignupState>(
  (ref) => SignupController()
);
