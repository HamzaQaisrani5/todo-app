import 'package:app_bottom_bar/src/controller/auth_controller/login_controller.dart';
import 'package:app_bottom_bar/src/states/auth_states/login_state.dart';
import 'package:riverpod/legacy.dart';

final logInProvider = StateNotifierProvider<LoginController, LoginState>(
  (ref) => LoginController(),
);
