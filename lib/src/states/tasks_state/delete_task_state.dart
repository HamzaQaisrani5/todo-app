sealed class DeleteTaskState {}

class DeleteTaskInitial extends DeleteTaskState {}

class DeleteTaskLoading extends DeleteTaskState {}

class DeleteTaskError extends DeleteTaskState {
  String errorMessage;
  DeleteTaskError(this.errorMessage);
}

class DeleteTaskSucces extends DeleteTaskState {
  String succesMessage;
  DeleteTaskSucces(this.succesMessage);
}
