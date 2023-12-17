import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy/models/account_model.dart';
import 'package:mentor_academy/models/userModel.dart';
import 'package:mentor_academy/core/cubits/update/update_states.dart';

import '../../network/constants.dart';
import '../../network/local/shared_prefrence.dart';
import '../../network/remote/dio_helper.dart';

class UpdateCubit extends Cubit<UpdateStates> {
  UpdateCubit() : super(UpdateInitState());

  static UpdateCubit get(context) => BlocProvider.of(context);



}
