import 'package:app_bottom_bar/src/service/tasks_service/add_task_service.dart';
import 'package:app_bottom_bar/src/states/tasks_state/add_task_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod/legacy.dart';

import '../../../annotation_way_of_project/features/task_management/domain/task_model/task_model.dart'
    show TaskModel;

class AddTaskController extends StateNotifier<AddTaskState> {
  AddTaskController() : super(AddTaskInitial());
  Future<void> addTask({
    required TaskModel task,
    required String userId,
  }) async {
    final addService = AddTaskService();
    state = AddTaskLoading();
    try {
      addService.addTask(task: task, userId: userId);
      state = AddTaskSuccess('Task updated successfully');
    } catch (e) {
      if (e is FirebaseException) {
        state = AddTaskError(e.message!);
      }
    }
  }
}
