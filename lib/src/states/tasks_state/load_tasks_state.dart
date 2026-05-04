import 'package:app_bottom_bar/annotation_way_of_project/features/task_management/domain/task_model/task_model.dart';

sealed class LoadTasksState {}

class LoadTasksInitial extends LoadTasksState {}

class LoadTasksLoading extends LoadTasksState {}

class LoadTasksSuccess extends LoadTasksState {
  List<TaskModel> allTasks;
  LoadTasksSuccess(this.allTasks);
}


class LoadTasksError extends LoadTasksState {
  String errorMessage;
  LoadTasksError(this.errorMessage);
}



