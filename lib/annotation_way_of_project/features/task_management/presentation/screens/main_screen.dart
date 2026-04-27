import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:app_bottom_bar/annotation_way_of_project/features/authentication/presentation/screens/account_screen/account_screen.dart';
import 'package:app_bottom_bar/annotation_way_of_project/features/task_management/presentation/screens/add_task_screen/add_task_screen.dart';
import 'package:app_bottom_bar/annotation_way_of_project/features/task_management/presentation/screens/all_tasks_screen/all_tasks_screen.dart';
import 'package:app_bottom_bar/annotation_way_of_project/features/task_management/presentation/screens/completed_task_screen/completed_task_screen.dart';
import 'package:app_bottom_bar/annotation_way_of_project/features/task_management/presentation/screens/incomplete_task_screen/incomplete_task_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _tabController.index = currentIndex;
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          AllTasksScreen(),
          IncompleteTaskScreen(),
          AddTaskScreen(),
          CompletedTaskScreen(),
          AccountScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            activeIcon: Icon(Icons.home_rounded),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.incomplete_circle_outlined),
            label: 'Incomplete',
            activeIcon: Icon(Icons.incomplete_circle_rounded),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Add',
            activeIcon: Icon(Icons.add_box_rounded),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outlined),
            label: 'Complete',
            activeIcon: Icon(Icons.check_box),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: 'Account',
            activeIcon: Icon(Icons.account_box),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            log('Value: $value');
            currentIndex = value;
          });
        },
        iconSize: 20,
      ),
    );
  }
}
