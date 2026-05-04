import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../annotation_way_of_project/features/task_management/domain/task_model/task_model.dart';

class AddTaskService {
  Future<void> addTask({
    required TaskModel task,
    required String userId,
  }) async {
    final _firestore = FirebaseFirestore.instance;
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('tasks')
          .add(task.toMap());
      log('*** Task Added ***');
    } catch (e) {
      log('Exception caught, when adding task: $e');
      rethrow;
    }
  }
}
