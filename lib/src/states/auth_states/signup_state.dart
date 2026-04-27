sealed class SignupState {
  SignupState();
}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupError extends SignupState {
  String errorMessage;
  SignupError(this.errorMessage);
}

class SignupSuccess extends SignupState {
  String successMessage;
  SignupSuccess(this.successMessage);
}
