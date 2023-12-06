import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy/core/network/remote/dio_helper.dart';

import 'Product states.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitState());

  static ProductCubit get(context) => BlocProvider.of(context);

  getAllproducts() async {
    emit(ProductLoadingState());
    return await DioHelper.getData(url: '/product/Laptops').then((value) {
      //print(value.data);
      //print(value.data['product'][0]['status']);
      // print(Product.fromJson(value.data, 5).description);
      print('😋😋😋😋${state}');
      print('🤑🤑🤑🤑🤑${value.statusCode}');
      emit(ProductDoneState());
    }).catchError((error) {
      print('😎😎😎😎😎${error.runtimeType}');
      print('😎😎😎😎😎${error.toString()}');
      emit(ProductErrorState(error));
    });
  }
}
