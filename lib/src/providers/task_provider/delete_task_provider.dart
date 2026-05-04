import 'package:app_bottom_bar/src/controller/tasks_controller/delete_task_controller.dart';
import 'package:flutter_riverpod/legacy.dart';

final deleteTaskProvider = StateNotifierProvider<DeleteTaskController, dynamic>(
  (ref) => DeleteTaskController(),
);
