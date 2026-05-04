import 'package:app_bottom_bar/src/service/tasks_service/complete_task_service.dart';
import 'package:app_bottom_bar/src/states/tasks_state/load_tasks_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/legacy.dart';

class CompleteTasksController extends StateNotifier<LoadTasksState> {
  CompleteTasksController() : super(LoadTasksInitial());

  void completeTasks({required String userId}) {
    final completeTasksService = CompleteTaskService();
    state = LoadTasksLoading();
    try {
      completeTasksService.loadCompleteTasks(userId).listen((completeTasks) {
        state = LoadTasksSuccess(completeTasks);
      });
    } catch (e) {
      if (e is FirebaseException) {
        state = LoadTasksError(e.message!);
      }
    }
  }
}
