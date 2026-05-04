import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class TaskCompletionService {
  Future<void> updateTaskCompletion({
    required String userId,
    required String taskId,
    required bool isComplete,
  }) async {
    final _firestore = FirebaseFirestore.instance;
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('tasks')
          .doc(taskId)
          .update({'isComplete': isComplete});
      log('Completed Task!');
    } catch (e) {
      log('Exception, when marking Completion');
      rethrow;
    }
  }
}
