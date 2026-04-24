import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app_bottom_bar/features/task_management/presentation/screens/add_task_screen/add_task_screen.dart';
import 'package:app_bottom_bar/routing/route_names/route_names.dart';

import '../../features/authentication/presentation/screens/register_screen.dart';
import '../../features/authentication/presentation/screens/sign_in_screen.dart';
import '../../features/task_management/presentation/screens/main_screen.dart';

import '../gorouter_refresh_stream/gorouter_refresh_stream.dart';

part 'app_router.g.dart';

// enum Routes { main, signIn, register }

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

@riverpod
GoRouter appRouter(Ref ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return GoRouter(
    initialLocation: RouteNames.main,
    redirect: (context, state) {
      final isLoggedIn = firebaseAuth.currentUser != null;
      if (isLoggedIn &&
          (state.uri.toString() == RouteNames.signIn ||
              state.uri.toString() == RouteNames.register)) {
        return RouteNames.main;
      } else if (!isLoggedIn &&
          state.uri.toString().startsWith(RouteNames.main)) {
        return RouteNames.register;
      } else {
        return null;
      }
    },
    refreshListenable: GorouterRefreshStream(firebaseAuth.authStateChanges()),
    routes: [
      GoRoute(
        path: RouteNames.main,
        name: RouteNames.main,
        builder: (context, state) {
          log('Route to RouteNames.main');
          return const MainScreen();
        },
      ),
      GoRoute(
        path: RouteNames.signIn,
        name: RouteNames.signIn,
        builder: (context, state) {
          log('Route to RouteNames.signIn');

          return const SignInScreen();
        },
      ),
      GoRoute(
        path: RouteNames.register,
        name: RouteNames.register,
        builder: (context, state) {
          log('Route to RouteNames.register');

          return const RegisterScreen();
        },
      ),
      GoRoute(
        path: RouteNames.addTaskScreen,
        name: RouteNames.addTaskScreen,
        builder: (context, state) {
          log('Route to RouteNames.addTaskScreen');
          return const AddTaskScreen();
        },
      ),
    ],
    debugLogDiagnostics: true,
  );
}
