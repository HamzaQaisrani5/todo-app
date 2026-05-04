import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../annotation_way_of_project/features/task_management/domain/task_model/task_model.dart';

class CompleteTaskService {
  Stream<List<TaskModel>> loadCompleteTasks(String userId) {
    try {
      var completeTasks = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('tasks')
          .where('isComplete', isEqualTo: true)
          .snapshots()
          .map(
            (querySnapShot) => querySnapShot.docs
                .map((doc) => TaskModel.fromMap({...doc.data(), 'id': doc.id}))
                .toList(),
          );

      log('loaded completed tasks');
      return completeTasks;
    } catch (e) {
      log('exception while loading completed task');
      rethrow;
    }
  }
}
