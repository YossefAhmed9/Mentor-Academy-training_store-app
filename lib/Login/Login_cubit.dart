import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/network/remote/dio_helper.dart';
import '../models/userModel.dart';
import 'Login_States.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;

  void login(String email, password) {
    emit(LoginLoadingState());
    DioHelper.getData(url: '/user/login', data: {
      "email": email,
      "password": password,
    }).then((value) {
      userModel = UserModel.fromJson(value.data);
      print(value.data);
      print('User Model is $userModel');
      emit(LoginDoneState());
    }).catchError((error) {
      print('Error: $error');
      print('Response: ${error.response}');
      print(error.toString());
      print(error.runtimeType);
      emit(LoginErrorState(error));
    });
  }
}
