import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy/core/network/local/shared_prefrence.dart';

import '../core/network/constants.dart';
import '../core/network/remote/dio_helper.dart';
import '../models/userModel.dart';
import 'Login_States.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;

  var nationalId;

  void login(String email, password) {
    emit(LoginLoadingState());
    DioHelper.postData(url: ApiConstants().loginApi, data: {
      "email": email,
      "password": password,
    }).then((value) {
      //userModel = UserModel.fromJson(value.data);
      nationalId = CasheHelper.setBoolean(
          key: 'nationalId', value: value.data['user']['nationalId']);
      print('This is nationalId $nationalId');
      print(value.data);
      emit(LoginDoneState());
    }).catchError((error) {
      print('Error: $error');
      print(error.toString());
      print(error.runtimeType);
      emit(LoginErrorState(error));
    });
  }
}
