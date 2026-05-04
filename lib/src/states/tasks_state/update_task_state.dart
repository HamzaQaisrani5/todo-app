sealed class UpdateTaskState {}

class UpdateTaskInitial extends UpdateTaskState {}

class UpdateTaskLoading extends UpdateTaskState {}

class UpdateTaskError extends UpdateTaskState {
  String errorMessage;
  UpdateTaskError(this.errorMessage);
}


class UpdateTaskSucces extends UpdateTaskState {
  String succesMessage;
  UpdateTaskSucces(this.succesMessage);
}





