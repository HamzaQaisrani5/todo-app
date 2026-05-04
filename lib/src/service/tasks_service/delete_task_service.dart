import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class DeleteTaskService {
  Future<void> deleteTask({
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
          .delete();
      log('Task deleted!');
    } catch (e) {
      log('Exception caught, whene deleting task $e');
      rethrow;
    }
  }
}
