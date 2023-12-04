import 'package:flutter_bloc/flutter_bloc.dart';

import 'Login_States.dart';

class loginCubit extends Cubit<loginStates> {
  loginCubit() : super(loginInitState());

  static loginCubit get(context) => BlocProvider.of(context);
}
