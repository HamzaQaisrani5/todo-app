// import 'package:app_bottom_bar/src/states/tasks_state/update_task_state.dart';
import 'dart:developer';

import 'package:app_bottom_bar/src/service/tasks_service/update_task_service.dart';
import 'package:app_bottom_bar/src/states/tasks_state/update_task_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../annotation_way_of_project/features/task_management/domain/task_model/task_model.dart'
    show TaskModel;

class UpdateTaskController extends StateNotifier {
  UpdateTaskController():super(dynamic);
  Future<void> updateTask({
    required TaskModel task,
    required String userId,
    required String taskId,
  }) async {
    final _updateService = UpdateTaskService();
    state = UpdateTaskLoading();
    try {
      _updateService.updateTask(task: task, userId: userId, taskId: taskId);
      state = UpdateTaskSucces('Task updated!');
    } catch (e) {
      if (e is FirebaseException) {
      state = UpdateTaskError('Failed to update task');
      }
    }
  }
}
