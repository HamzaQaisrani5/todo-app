import 'package:app_bottom_bar/annotation_way_of_project/features/task_management/domain/task_model/task_model.dart';
import 'package:app_bottom_bar/src/service/tasks_service/load_tasks_service.dart';
import 'package:app_bottom_bar/src/states/tasks_state/load_tasks_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/legacy.dart';

class LoadTasksController extends StateNotifier<LoadTasksState> {
  LoadTasksController() : super(LoadTasksInitial());

  // ignore: empty_constructor_bodies
  void loadTasks({required String userId}) async {
    final _loadTasksService = LoadTasksService();
    state = LoadTasksLoading();
    try {
      _loadTasksService.loadTasks(userId: userId).listen((tasks){
      state = LoadTasksSuccess(tasks);
      if (tasks.isEmpty) {
        state = LoadTasksError('Don\'t have tasks yet. . . ');
      }
      });
    } catch (e) {
      if (e is FirebaseException) {
        state = LoadTasksError(e.message!);
      }
    }
  }
}
