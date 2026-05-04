import 'package:app_bottom_bar/annotation_way_of_project/features/task_management/domain/task_model/task_model.dart';
import 'package:app_bottom_bar/src/service/tasks_service/delete_task_service.dart';
import 'package:app_bottom_bar/src/states/tasks_state/delete_task_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/legacy.dart';

class DeleteTaskController extends StateNotifier<dynamic> {
  DeleteTaskController() : super(DeleteTaskInitial());

  Future<void> deletetask({
    required TaskModel task,
    required String userId,
    required String taskId,
  }) async {
    final deleteService = DeleteTaskService();
    state = DeleteTaskLoading();
    try {
      deleteService.deleteTask(userId: userId, taskId: taskId);
      state = DeleteTaskSucces('Task Deleted');
    } catch (e) {
      if (e is FirebaseException) {
        state = DeleteTaskError(e.message!);
      }
    }
  }
}
