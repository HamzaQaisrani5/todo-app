import 'package:app_bottom_bar/src/states/tasks_state/add_task_state.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../controller/tasks_controller/add_task_controller.dart';

final addTaskProvider = StateNotifierProvider<AddTaskController, AddTaskState>(
  (ref) => AddTaskController(),
);
