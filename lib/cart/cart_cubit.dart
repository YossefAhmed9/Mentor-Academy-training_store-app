import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy/core/network/local/shared_prefrence.dart';
import 'package:mentor_academy/core/network/remote/dio_helper.dart';

import '../core/network/constants.dart';
import 'cart states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitState());

  static CartCubit get(context) => BlocProvider.of(context);
  List cartProducts = [];
  void addToCart({required String nationalId, productId}) {
    emit(CartLoadingState());
    DioHelper.postData(url: ApiConstants().addCartApi, data: {
      "nationalId": nationalId,
      "productId": productId,
      "quantity": "1"
    }).then((value) {
      emit(CartDoneState());
    }).catchError((error) {
      emit(CartErrorState(error));
      print('This is productId $productId');
      print('This is nationalId $nationalId');
      print(error.toString());
      print(error.runtimeType);
    });
  }

  //CartModel? cartModel;
  var cart;
  Future<void> getCart() async {
    emit(GetCartLoadingState());

    await DioHelper.getData(url: ApiConstants().getCartApi, data: {
      "nationalId": CasheHelper.getBoolean(key: 'nationalId'),
    }).then((value) {
      //cartModel = CartModel.fromJson(value.data);
      //cartProducts.addAll(value.data);
      cart = value.data;
      print('This is value ${cart}');
      emit(GetCartDoneState());
    }).catchError((error) {
      emit(GetCartErrorState(error));
      print(error.toString());
      print(error.runtimeType);
    });
  }

  void deleteCart(String nationalId, productId) {
    emit(CartDeleteLoadingState());
    DioHelper.delData(url: ApiConstants().deleteCartApi, data: {
      "nationalId": nationalId,
      "productId": productId,
    }).then((value) {
      // cartModel = CartModel.fromJson(value.data);
      print(value.data);
      emit(CartDeleteDoneState());
    }).catchError((error) {
      emit(CartDeleteErrorState(error));
      print(error.toString());
      print(error.runtimeType);
    });
  }

  void updateCart() {
    DioHelper.postData(url: ApiConstants().updateCartApi, data: {});
  }

  void favorite() {
    DioHelper.getData(url: ApiConstants().favoriteCartApi);
  }

  updateQuantity({productId}) {
    DioHelper.putData(url: ApiConstants().updateCartApi, data: {
      "nationalId ": CasheHelper.getBoolean(key: 'nationalId'),
      "productId": productId,
      "quantity": '1',
    }).then((value) {
      print(value.data);
    }).catchError((error) {
      print(error.toString());
      print(error.runtimeType);
    });
  }

  int number = 1;
  void inrceaseNumber() {
    number++;
    emit(ProductQuantityPlus());
  }

  void decreaseNumber() {
    number--;
    emit(ProductQuantityMinus());
  }
}
