import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../annotation_way_of_project/features/task_management/domain/task_model/task_model.dart';

class UpdateTaskService {
  Future<void> updateTask({
    required TaskModel task,
    required String userId,
    required String taskId,
  }) async {
    final _firestore = FirebaseFirestore.instance;
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('tasks')
          .doc(taskId)
          .update(task.toMap());
      log('*** Task updated ***');
    } catch (e) {
      log('Failed to update task $e');
      rethrow;
    }
  }
}
