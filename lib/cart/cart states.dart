abstract class CartStates {}

class CartInitState extends CartStates {}

class CartLoadingState extends CartStates {}

class CartDoneState extends CartStates {}

class CartDeleteLoadingState extends CartStates {}

class CartDeleteDoneState extends CartStates {}

class CartUpdateState extends CartStates {}

class CartUpdateErrorState extends CartStates {
  final error;

  CartUpdateErrorState(this.error);
}

class CartDeleteErrorState extends CartStates {
  final error;

  CartDeleteErrorState(this.error);
}

class CartErrorState extends CartStates {
  final error;

  CartErrorState(this.error);
}

class GetCartLoadingState extends CartStates {}

class GetCartDoneState extends CartStates {}

class GetCartErrorState extends CartStates {
  final error;

  GetCartErrorState(this.error);
}

class ProductQuantityPlus extends CartStates {}

class ProductQuantityMinus extends CartStates {}
