import 'package:app_bottom_bar/src/controller/tasks_controller/load_tasks_controller.dart';
import 'package:app_bottom_bar/src/states/tasks_state/load_tasks_state.dart';
import 'package:flutter_riverpod/legacy.dart';

final loadTasksProvider =
    StateNotifierProvider<LoadTasksController, LoadTasksState>(
      (ref) => LoadTasksController(),
    );
