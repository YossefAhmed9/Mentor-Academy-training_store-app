import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy/core/network/remote/dio_helper.dart';

import 'Product states.dart';
import 'models/product_model.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitState());

  static ProductCubit get(context) => BlocProvider.of(context);
  var result;

  getAllproducts() async {
    emit(ProductLoadingState());
    await DioHelper.getData(url: '/product/Laptops').then((value) async {
      result = value.data;
      // print('😁😁😁${state}');

      emit(ProductDoneState());
      //print(value.data);
      //print(value.data['product'][0]['status']);
      print(Product.fromJson(value.data, 3).name);
      //print(result);
    }).catchError((error) {
      print('${error.runtimeType}');
      print('${error.toString()}');
      emit(ProductErrorState(error));
    });
  }
}
