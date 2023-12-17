import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy/account_model.dart';
import 'package:mentor_academy/models/userModel.dart';
import 'package:mentor_academy/update/update_states.dart';

import '../core/network/constants.dart';
import '../core/network/local/shared_prefrence.dart';
import '../core/network/remote/dio_helper.dart';

class UpdateCubit extends Cubit<UpdateStates> {
  UpdateCubit() : super(UpdateInitState());

  static UpdateCubit get(context) => BlocProvider.of(context);



}
