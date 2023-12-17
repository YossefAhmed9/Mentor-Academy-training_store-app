abstract class AccountStates{}
class AccountInitState extends AccountStates {}

class AccountLoadingState extends AccountStates {}

class AccountDoneState extends AccountStates {}

class AccountErrorState extends AccountStates {
  final error;

  AccountErrorState(this.error);
}


class UpdateInitState extends AccountStates {}

class UpdateLoadingState extends AccountStates {}

class UpdateDoneState extends AccountStates {}

class UpdateErrorState extends AccountStates {
  final error;

  UpdateErrorState(this.error);
}
