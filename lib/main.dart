import 'package:app_bottom_bar/firebase_options.dart';
import 'package:app_bottom_bar/src/routing/state_app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(ProviderScope(child: const MyApp()));
}

final refProvider = Provider<Ref>((ref) => ref);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: StateAppRouter.router(),

      // ref.watch(appRouterProvider),
      // title: 'Todo App',
      // theme: ThemeData(
      //   colorScheme: .fromSeed(seedColor: Colors.green),
      //   appBarTheme: AppBarTheme().copyWith(
      //     backgroundColor: Colors.green,
      //     centerTitle: true,
      //   ),
      //   bottomNavigationBarTheme: BottomNavigationBarThemeData().copyWith(
      //     backgroundColor: Colors.green,
      //     selectedItemColor: Colors.white,
      //     unselectedItemColor: Colors.black,
      //   ),
      // ),
    );
  }
}


// mail: teknoloje@gmail.com
// pswrd: 123456