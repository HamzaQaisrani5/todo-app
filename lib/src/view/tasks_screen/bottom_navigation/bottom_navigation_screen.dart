import 'package:app_bottom_bar/annotation_way_of_project/features/task_management/presentation/screens/all_tasks_screen/all_tasks_screen.dart';
import 'package:app_bottom_bar/src/providers/bottom_navigation_provider/bottom_navigation_provider.dart';
import 'package:app_bottom_bar/src/view/tasks_screen/add_task_screen.dart';
import 'package:app_bottom_bar/src/view/tasks_screen/all_tasks_screen.dart';
import 'package:app_bottom_bar/src/view/tasks_screen/bottom_navigation/bottom_nav_item.dart';
import 'package:app_bottom_bar/src/view/tasks_screen/bottom_navigation/custom_bottom_nav_bar.dart';
import 'package:app_bottom_bar/src/view/tasks_screen/complete_tasks.dart';
import 'package:app_bottom_bar/src/view/tasks_screen/incomplete_tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavigationScreen extends ConsumerStatefulWidget {
  final int initialIndex;
  const BottomNavigationScreen({super.key, this.initialIndex = 0});

  @override
  ConsumerState<BottomNavigationScreen> createState() => _State();
}

class _State extends ConsumerState<BottomNavigationScreen> {
  List<Widget> _screen() {
    return [HomeScreen(), CompleteTasks(), IncompleteTasks(), AddTask(),];
  }

  @override
  Widget build(BuildContext context) {
    final bottomIndex = ref.watch(bottomNavigationProvider);
    final screens = _screen();
    return Scaffold(
      body: IndexedStack(index: bottomIndex, children: screens),
      bottomNavigationBar:
          // BottomNavigationBar(
          //   items: [
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.home, color: Colors.white),
          //       activeIcon: Icon(Icons.home, color: Colors.black),
          //       label: 'Hoe'
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.home, color: Colors.white),
          //       activeIcon: Icon(Icons.home, color: Colors.black),
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.home, color: Colors.white),
          //       activeIcon: Icon(Icons.home, color: Colors.black),
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.home, color: Colors.white),
          //       activeIcon: Icon(Icons.home, color: Colors.black),
          //     ),
          //   ],
          //   onTap: (value) {
          //     ref.read(bottomNavigationProvider.notifier).setIndex(value);
          //   },
          // ),
          CustomBottomNavBar(
            currentIndex: bottomIndex,
            onTap: (index) {
              ref.read(bottomNavigationProvider.notifier).setIndex(index);
            },
            items: [
              BottomNavItem(
                activeIcon: Icon(Icons.home, color: Colors.white),
                inactiveIcon: Icon(Icons.home, color: Colors.black),
                label: 'all tasks',
              ),
              BottomNavItem(
                activeIcon: Icon(Icons.check, color: Colors.white),
                inactiveIcon: Icon(Icons.check, color: Colors.black),
                label: 'completed task',
              ),
              BottomNavItem(
                activeIcon: Icon(
                  Icons.incomplete_circle_outlined,
                  color: Colors.white,
                ),
                inactiveIcon: Icon(
                  Icons.incomplete_circle_outlined,
                  color: Colors.black,
                ),
                label: "incomplete",
              ), // ← CENTER EMPTY
              BottomNavItem(
                activeIcon: Icon(Icons.add, color: Colors.white),
                inactiveIcon: Icon(Icons.add, color: Colors.black),
                label: 'Add Task',
              ),
              // BottomNavItem(
              //   activeIcon: Icon(Icons.account_box_rounded, color: Colors.white,),
              //   inactiveIcon: Icon(Icons.account_box_rounded, color: Colors.black,),
              //   label: 'account'
              // ),
            ],
          ),
    );
  }
}
