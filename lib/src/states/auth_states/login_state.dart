sealed class LoginState {
  LoginState();
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  String successMessage;
  LoginSuccess(this.successMessage);
}

class LoginError extends LoginState {
  String errorMessage;
  LoginError(this.errorMessage);
}
