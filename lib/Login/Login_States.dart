abstract class LoginStates {}

class LoginInitState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginDoneState extends LoginStates {}

class LoginImageChoose extends LoginStates {}

class LoginErrorState extends LoginStates {
  final error;

  LoginErrorState(this.error);
}
