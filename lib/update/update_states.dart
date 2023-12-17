abstract class UpdateStates{}
class UpdateInitState extends UpdateStates {}

class UpdateLoadingState extends UpdateStates {}

class UpdateDoneState extends UpdateStates {}

class UpdateErrorState extends UpdateStates {
  final error;

  UpdateErrorState(this.error);
}
