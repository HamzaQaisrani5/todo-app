import 'package:app_bottom_bar/src/controller/tasks_controller/task_completion_controller.dart';
import 'package:app_bottom_bar/src/states/tasks_state/task_completion_state.dart';
import 'package:flutter_riverpod/legacy.dart';

final taskCompletionProvider =
    StateNotifierProvider<TaskCompletionController, TaskCompletionState>(
      (ref) => TaskCompletionController(),
    );
