import 'package:app_bottom_bar/src/service/tasks_service/task_completion_service.dart';
import 'package:app_bottom_bar/src/states/tasks_state/task_completion_state.dart';
import 'package:riverpod/legacy.dart';

class TaskCompletionController extends StateNotifier<TaskCompletionState> {
  TaskCompletionController() : super(TaskCompletionInitial());

  Future<void> taskCompletion({
    required String userId,
    required String taskId,
    required bool isComplete,
  }) async {
    final completionService = TaskCompletionService();
    state = TaskCompletionLoading();
    try {
      completionService.updateTaskCompletion(
        userId: userId,
        taskId: taskId,
        isComplete: isComplete,
      );
      state = TaskCompletionSuccess();
    } catch (e) {
      state = TaskCompletionError();
    }
  }
}
