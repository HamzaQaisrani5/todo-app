sealed class TaskCompletionState {}


class TaskCompletionInitial extends TaskCompletionState{}


class TaskCompletionLoading extends TaskCompletionState{

}


class TaskCompletionError extends TaskCompletionState{}


class TaskCompletionSuccess extends TaskCompletionState{}

