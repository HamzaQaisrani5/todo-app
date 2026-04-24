import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app_bottom_bar/features/authentication/data/firebase_auth_repository/auth_repository.dart';

part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {
    // TODO: implement build
    throw UnimplementedError();
  }

  //   register user controller
  Future<void> createuserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() {
      return ref
          .read(authRepositoryProvider)
          .createUserWithEmailAndPassword(email: email, password: password);
    });
  }

  //   sign in user
  Future<void> signInUserWithEmailPassword({
    required String email,
    required String password,
  }) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() {
      return ref
          .read(authRepositoryProvider)
          .signInWithEmailAndPassword(email: email, password: password);
    });
  }


  Future<void> signOut() async {
    state = AsyncLoading();
    try {
      ref.read(authRepositoryProvider).signOut();
      if (ref.mounted) {
        state = AsyncData(null);
      } else {
        return;
      }
    } catch (e, st) {
      if (ref.mounted) {
        state = AsyncError(e, st);
      }
      return;
    }
  }
}
