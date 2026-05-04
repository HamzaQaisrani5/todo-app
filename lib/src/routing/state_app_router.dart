import 'package:app_bottom_bar/annotation_way_of_project/features/task_management/presentation/screens/add_task_screen/add_task_screen.dart';
import 'package:app_bottom_bar/annotation_way_of_project/features/task_management/presentation/screens/all_tasks_screen/all_tasks_screen.dart';
import 'package:app_bottom_bar/src/routing/state_go_router_refresh_stream.dart';
import 'package:app_bottom_bar/src/routing/state_route_name.dart';
import 'package:app_bottom_bar/src/view/auth/login_screen.dart';
import 'package:app_bottom_bar/src/view/auth/signup_screen.dart';
import 'package:app_bottom_bar/src/view/tasks_screen/add_task_screen.dart';
import 'package:app_bottom_bar/src/view/tasks_screen/all_tasks_screen.dart';
import 'package:app_bottom_bar/src/view/tasks_screen/bottom_navigation/bottom_navigation_screen.dart';
import 'package:app_bottom_bar/src/view/tasks_screen/complete_tasks.dart';
import 'package:app_bottom_bar/src/view/tasks_screen/incomplete_tasks.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class StateAppRouter {
  static GoRouter router() {
    // final isLoggedIn =
    //     ref.watch(stateFirebaseAuthProvider).currentUser != null; //user is loggedIN
    return GoRouter(
      initialLocation: StateRouteNames.signupScreen,
      // redirect: (context, state) {
      //   if (isLoggedIn &&
      //           state.uri.toString().startsWith(StateRouteNames.signInScreen) ||
      //       isLoggedIn &&
      //           state.uri.toString().startsWith(
      //             StateRouteNames.registerScreen,
      //           )) {
      //     return StateRouteNames.homeScreen;
      //   } else if (!isLoggedIn &&
      //       state.uri.toString().startsWith(StateRouteNames.homeScreen)) {
      //     return StateRouteNames.registerScreen;
      //   } else {
      //     return null;
      //   }
      // },
      // refreshListenable: StateGoRouterRefreshStream(
      //   ref.watch(stateFirebaseAuthProvider).authStateChanges(),
      // ),
      routes: [
        GoRoute(
          path: StateRouteNames.signupScreen,
          name: StateRouteNames.signupScreen,
          builder: (context, state) {
            return SignupScreen();
          },
        ),
        GoRoute(
          path: StateRouteNames.signInScreen,
          name: StateRouteNames.signInScreen,
          builder: (context, state) {
            return LoginScreen();
          },
        ),
        GoRoute(
          path: StateRouteNames.homeScreen,
          name: StateRouteNames.homeScreen,
          builder: (context, state) {
            return HomeScreen();
          },
        ),
        GoRoute(
          path: StateRouteNames.addTaskscreen,
          name: StateRouteNames.addTaskscreen,
          builder: (context, state) {
            return AddTask();
          },
        ),
        GoRoute(
          path: StateRouteNames.incompleteTask,
          name: StateRouteNames.incompleteTask,
          builder: (context, state) {
            return IncompleteTasks();
          },
        ),
        GoRoute(
          path: StateRouteNames.completeTask,
          name: StateRouteNames.completeTask,
          builder: (context, state) {
            return CompleteTasks();
          },
        ),
        GoRoute(
          path: StateRouteNames.bottomscreen,
          name: StateRouteNames.bottomscreen,
          builder: (context, state) {
            return BottomNavigationScreen();
          },
        ),
      ],
    );
  }
}
