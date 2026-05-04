import 'package:app_bottom_bar/src/controller/tasks_controller/update_task_controller.dart';
import 'package:flutter_riverpod/legacy.dart';

final updateTaskProvider = StateNotifierProvider<UpdateTaskController, dynamic>(
  (ref) => UpdateTaskController(),
);
