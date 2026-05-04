import 'package:app_bottom_bar/src/controller/bottom_navigation_controller.dart/bottom_navigation_controller.dart';
import 'package:riverpod/legacy.dart';

final bottomNavigationProvider =
    StateNotifierProvider<BottomNavigationController, int>(
      (ref) => BottomNavigationController(),
    );
