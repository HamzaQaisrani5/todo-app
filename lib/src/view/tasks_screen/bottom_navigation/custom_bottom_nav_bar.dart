// Replace your entire CustomBottomNavBar with this:
import 'package:app_bottom_bar/src/view/tasks_screen/bottom_navigation/bottom_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomBottomNavBar extends ConsumerWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomNavItem> items;

  CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int itemCount = items.length;

    return Container(
      height: 75, // 10.h
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 14,
        //     offset: Offset(0, -10),
        //   ),
        // ],
      ),
      child: Row(
        children: List.generate(itemCount, (index) {
          return Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => onTap(index),
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    index == currentIndex
                        ? items[index].activeIcon
                        : items[index].inactiveIcon,
                    SizedBox(height: 4),
                    Text(
                      items[index].label,
                      style: TextStyle(
                        fontSize: 12,
                        color: index == currentIndex
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
