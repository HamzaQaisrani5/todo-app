import 'dart:async';

// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app_bottom_bar/features/task_management/data/firestore_repository/firestore_repository.dart';
import 'package:app_bottom_bar/features/task_management/domain/task_model/task_model.dart';

part 'firestore_controller.g.dart';

@Riverpod(keepAlive: true)
class FirestoreController extends _$FirestoreController {
  @override
  FutureOr<dynamic> build() {
    // TODO: implement build
    throw UnimplementedError();
  }

  Future<void> addTask({
    required TaskModel task,
    required String userId,
  }) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() {
      return ref
          .read(firestoreRepositoryProvider)
          .addTask(task: task, userId: userId);
    });
  }

  Future<void> updateTask({
    required TaskModel task,
    required String userId,
    required String taskId,
  }) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() {
      return ref
          .read(firestoreRepositoryProvider)
          .updateTask(task: task, userId: userId, taskId: taskId);
    });
  }

  Future<void> deleteTask({
    required TaskModel task,
    required String userId,
    required String taskId,
  }) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() {
      return ref
          .read(firestoreRepositoryProvider)
          .deleteTask(userId: userId, taskId: taskId);
    });
  }
}
