import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy/core/network/local/shared_prefrence.dart';

import '../../../models/account_model.dart';
import '../../network/constants.dart';
import '../../network/remote/dio_helper.dart';
import 'account_states.dart';

class AccountCubit extends Cubit<AccountStates> {
  AccountCubit() : super(AccountInitState());

  static AccountCubit get(context) => BlocProvider.of(context);

  AccountData? account;
  var getResult;
  var updateResult;
  Future<void> getProfile({token}) async {
    emit(AccountLoadingState());
   await DioHelper.postData(url: ApiConstants().profile, data: {
      "token": CasheHelper.getBoolean(key: 'token'),
    }).then((value) {
      account = AccountData.fromJson(value.data['user']);
      getResult=value.data['user'];
      updateResult = value.data['user'];
      print(value.data);
      emit(AccountDoneState());
    }).catchError((error) {
      print('Error: $error');
      print(error.toString());
      print(error.runtimeType);
      emit(AccountErrorState(error));
    });
  }

  Future<void> updateProfile(String name, email, phone) async {
    emit(UpdateLoadingState());
    await DioHelper.putData(url: ApiConstants().updateProfile, data: {
      "name": name,
      "phone": phone,
      "email": email,
      "password":"1234567890",
      "token":CasheHelper.getBoolean(key: 'token')
    }).then((value) {
      account = AccountData.fromJson(value.data['user']);
      updateResult = value.data['user'];
      print(value.data);
      emit(UpdateDoneState());

    }).catchError((error) {
      print('Error: $error');
      print(error.toString());
      print(error.runtimeType);
      emit(UpdateErrorState(error));
    });
  }


}