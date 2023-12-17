import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy/core/network/remote/dio_helper.dart';
import 'Product states.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitState());

  static ProductCubit get(context) => BlocProvider.of(context);
  var result;
  List list = [];

  getAllproducts() async {
    emit(ProductLoadingState());
    await DioHelper.getData(url: 'product/Laptops').then((value) {
      result = value.data;
      list.addAll(value.data['product']);
      print(value.data);
      emit(ProductDoneState());
    }).catchError((error) {
      print('${error.runtimeType}');
      print('${error.toString()}');
      emit(ProductErrorState(error));
    });
  }
}