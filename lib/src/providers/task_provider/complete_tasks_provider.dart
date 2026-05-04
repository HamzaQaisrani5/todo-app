import 'package:app_bottom_bar/src/controller/tasks_controller/complete_tasks_controller.dart';
import 'package:app_bottom_bar/src/states/tasks_state/load_tasks_state.dart';
import 'package:flutter_riverpod/legacy.dart';

final completeTasksProvider =
    StateNotifierProvider<CompleteTasksController, LoadTasksState>(
      (ref) => CompleteTasksController(),
    );
