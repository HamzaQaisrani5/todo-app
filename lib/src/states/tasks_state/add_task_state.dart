sealed class AddTaskState {}

class AddTaskInitial extends AddTaskState {}

class AddTaskLoading extends AddTaskState {}

class AddTaskError extends AddTaskState {
  String errorMessage;
  AddTaskError(this.errorMessage);
}

class AddTaskSuccess extends AddTaskState {
  String successMessage;
  AddTaskSuccess(this.successMessage);
}
