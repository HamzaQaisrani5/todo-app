import 'package:flutter/material.dart';

class BottomNavItem {
  final Icon activeIcon;
  final Icon inactiveIcon;
  final String label;

  BottomNavItem({
    required this.activeIcon,
    required this.inactiveIcon,
    required this.label,
  });
}