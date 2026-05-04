import 'package:app_bottom_bar/src/service/auth_service/logout_service.dart';
import 'package:app_bottom_bar/src/states/auth_states/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod/legacy.dart';

class LogoutController extends StateNotifier<LoginState> {
  LogoutController() : super(LoginInitial());
  Future<void> logOut({required String userId}) async {
    final logoutService = LogoutService();
    state = LoginLoading();
    try {
      logoutService.logOut(userId: userId);
      state = LoginSuccess('Logged out');
    } catch (e) {
      if (e is FirebaseException) {
        state = LoginSuccess('Logged out successfully');
      }
    }
  }
}
