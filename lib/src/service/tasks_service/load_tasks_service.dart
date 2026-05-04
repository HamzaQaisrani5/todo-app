import 'dart:developer';

import 'package:app_bottom_bar/annotation_way_of_project/features/task_management/domain/task_model/task_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoadTasksService {
  Stream<List<TaskModel>> loadTasks({required String userId}) {
    try {
      log('*** loading tasks ***');
      var tasks = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('tasks')
          .orderBy('date', descending: true)
          .snapshots()
          .map(
            (querySnapShot) => querySnapShot.docs
                .map(
                  (docs) => TaskModel.fromMap({...docs.data(), 'id': docs.id}),
                )
                .toList(),
          ); 
      return tasks;
    } catch (e) {
      log('Exception caught when loading all tasks: $e');
      rethrow;
    }
  }
}
