import 'dart:developer';

import 'package:app_bottom_bar/annotation_way_of_project/features/task_management/domain/task_model/task_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class IncompleteTaskService {
  Stream<List<TaskModel>> loadInCompleteTasks(String userId) {
    // final _firestore = FirebaseFirestore.instance;
    try {
      var inCompletetasks = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('tasks')
          .where('isComplete', isEqualTo: false)
          .snapshots()
          .map(
            (querySnapShot) => querySnapShot.docs
                .map((doc) => TaskModel.fromMap({...doc.data(), 'id': doc.id}))
                .toList(),
          );
      return inCompletetasks;
      // FirebaseFirestore.instance
      //     .collection('users')
      //     .doc(userId)
      //     .collection('tasks')
      //     .where('isComplete', isEqualTo: false)
      //     .snapshots()
      //     .map(
      //       (querySnapShot) => querySnapShot.docs
      //           .map((doc) => TaskModel.fromMap({...doc.data(), 'id': doc.id}))
      //           .toList(),
      //     );
    } catch (e) {
      log('Exception while loading incomplete tasks: $e');
      rethrow;
    }
  }
}
