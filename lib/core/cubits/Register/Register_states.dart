abstract class RegisterStates {}

class registerInitState extends RegisterStates {}

class registerLoadingState extends RegisterStates {}

class registerDoneState extends RegisterStates {}

class registerImageChoose extends RegisterStates {}

class registerErrorState extends RegisterStates {
  final error;

  registerErrorState(this.error);
}

class ShowPassState extends RegisterStates {}
