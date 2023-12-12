import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy/core/network/local/shared_prefrence.dart';
import 'package:mentor_academy/core/network/remote/dio_helper.dart';

import '../core/network/constants.dart';
import 'cart states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitState());

  static CartCubit get(context) => BlocProvider.of(context);


  Future<void> addToCart({required String nationalId, productId}) async {
    emit(CartLoadingState());
    await getCart();
    await DioHelper.postData(url: ApiConstants().addCartApi, data: {
      "nationalId": nationalId,
      "productId": productId,
      "quantity": "1"
    }).then((value) async {
      cartList.add(value);
      await getCart();
      emit(CartDoneState());
    }).catchError((error) {
      emit(CartErrorState(error));
      print('This is productId $productId');
      print('This is nationalId $nationalId');
      print(error.toString());
      print(error.runtimeType);
    });
  }

  var cartValue;
  List cartList = [];
  Future<void> getCart() async {
    emit(GetCartLoadingState());

    await DioHelper.getData(url: ApiConstants().getCartApi, data: {
      "nationalId": CasheHelper.getBoolean(key: 'nationalId'),
    }).then((value) {
      //cartModel = CartModel.fromJson(value.data);
      //cartProducts.addAll(value.data);
      print('This is cartList length from getCart() ${cartList.length}');
      cartValue = value.data;
      cartList.add(value.data['products']);
      print('This is value ${cartValue}');
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
      cartList.remove(value);
      getCart();
      print(value.data);
      emit(CartDeleteDoneState());
    }).catchError((error) {
      emit(CartDeleteErrorState(error));
      print(error.toString());
      print(error.runtimeType);
    });
  }

  void favorite() {
    DioHelper.getData(url: ApiConstants().favoriteCartApi);
  }

  var updateValue;
  List updateList=[];
  void updateQuantity({required productId, nationalId}) async {
    emit(CartUpdateLoadingState());
    await DioHelper.putData(url: ApiConstants().updateCartApi, data: {
      "nationalId ": nationalId,
      "productId": productId,
      "quantity": 1
    }).then((value) {
      updateValue = value.data;
      cartList.clear();
      cartList.add(value);
      //updateList.addAll(value.data);
      getCart();
      emit(CartUpdateDoneState());
      print('This is UPDATED value ${value.data}');
    }).catchError((error) {
      print(error.toString());
      print(error.runtimeType);
      emit(CartUpdateErrorState(error));
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
