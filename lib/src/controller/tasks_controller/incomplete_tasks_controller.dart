import 'dart:developer';
import 'package:app_bottom_bar/src/service/tasks_service/incomplete_task_service.dart';
import 'package:app_bottom_bar/src/states/tasks_state/load_tasks_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/legacy.dart';

class IncompleteTaskController extends StateNotifier<LoadTasksState> {
  IncompleteTaskController() : super(LoadTasksInitial());

  void loadinCompleteTask({required String userId}) async {
    final incompleteService = IncompleteTaskService();
    state = LoadTasksLoading();
    try {
      incompleteService.loadInCompleteTasks(userId).listen((incompleteTasks) {
        state = LoadTasksSuccess(incompleteTasks);
        if (incompleteTasks.isEmpty) {
          state = LoadTasksError('Don\'t have incomplete tasks yet . . . ');
        }
      });
    } catch (e) {
      if (e is FirebaseException) {
        state = LoadTasksError(e.message!);
      }
    }
  }
}
