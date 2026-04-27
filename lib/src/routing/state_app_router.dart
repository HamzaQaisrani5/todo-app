import 'package:app_bottom_bar/src/routing/state_go_router_refresh_stream.dart';
import 'package:app_bottom_bar/src/routing/state_route_name.dart';
import 'package:app_bottom_bar/src/view/auth/login_screen.dart';
import 'package:app_bottom_bar/src/view/auth/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
//   return FirebaseAuth.instance;
// });

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
      ],
    );
  }
}
