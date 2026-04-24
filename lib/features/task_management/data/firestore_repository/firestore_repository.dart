// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app_bottom_bar/features/task_management/domain/task_model/task_model.dart';
part 'firestore_repository.g.dart';

class FirestoreRepository {
  FirebaseFirestore _firestore;
  FirestoreRepository(this._firestore);

  Future<void> addTask({
    required TaskModel task,
    required String userId,
  }) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .add(task.toMap());
  }

  Future<void> updateTask({
    required TaskModel task,
    required String userId,
    required String taskId,
  }) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .doc(taskId)
        .update(task.toMap());
  }

  Stream<List<TaskModel>> loadTasks(String userId) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .orderBy('date', descending: true)
        .snapshots()
        .map(
          (querySnapShot) => querySnapShot.docs
              .map((doc) => TaskModel.fromMap({...doc.data(), 'id': doc.id}))
              .toList(),
        );
  }

  Stream<List<TaskModel>> loadCompleteTasks(String userId) {
    return FirebaseFirestore.instance
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
  }

  Stream<List<TaskModel>> loadInCompleteTasks(String userId) {
    return FirebaseFirestore.instance
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
  }

  Future<void> deleteTask({
    required String userId,
    required String taskId,
  }) async {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .doc(taskId)
        .delete();
  }

  Future<void> updateTaskCompletion({
    required String userId,
    required String taskId,
    required bool isComplete,
  }) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .doc(taskId)
        .update({'isComplete': isComplete});
  }
}

@Riverpod(keepAlive: true)
FirestoreRepository firestoreRepository(Ref ref) {
  return FirestoreRepository(FirebaseFirestore.instance);
}

@Riverpod()
Stream<List<TaskModel>> loadComplateTask(Ref ref, String userId) {
  return ref.watch(firestoreRepositoryProvider).
  loadCompleteTasks(userId);
}

@Riverpod()
Stream<List<TaskModel>> loadInComplateTask(Ref ref, String userId) {
  return ref.watch(firestoreRepositoryProvider).loadInCompleteTasks(userId);
}

// @Riverpod()
// Stream<List<TaskModel>> loadTask(Ref ref, String userId) {
//   // final _firebaseRepository = ref.watch(firestoreRepositoryProvider);
//   return ref.watch(firestoreRepositoryProvider).loadTasks(userId);
// }

@Riverpod()
Stream<List<TaskModel>> loadTask(Ref ref, String userId) {
  return ref.watch(firestoreRepositoryProvider).loadTasks(userId);
}
