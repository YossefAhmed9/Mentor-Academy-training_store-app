abstract class ProductStates {}

class ProductInitState extends ProductStates {}

class ProductLoadingState extends ProductStates {}

class ProductDoneState extends ProductStates {}

class ProductErrorState extends ProductStates {
  final error;

  ProductErrorState(this.error);
}
