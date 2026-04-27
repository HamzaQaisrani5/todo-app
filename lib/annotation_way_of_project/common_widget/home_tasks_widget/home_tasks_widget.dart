import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class HomeTasksWidget<T> extends StatelessWidget {
  final AsyncValue<T> value;
  final Widget Function(T) data;
  const HomeTasksWidget({super.key, required this.value, required this.data});

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: (error, stackTrace) {
        return Center(child: Text(error.toString()));
      },
      loading: () {
        return Center(child: CircularProgressIndicator(color: Colors.green));
      },
    );
  }
}
