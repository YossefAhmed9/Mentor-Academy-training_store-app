import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/onBoarding_model.dart';
import '../../network/local/shared_prefrence.dart';
import 'onBoarding_states.dart';

class onBoardingCubit extends Cubit<onBoardingStates> {
  onBoardingCubit() : super(onBoardingInitState());

  static onBoardingCubit get(context) => BlocProvider.of(context);
  bool isLastPage = false;
  int onBoardingIndex = 0;
  void pageLast(int index) {
    isLastPage = true;
    onBoardingIndex = index;
    print('Last page= $isLastPage');
    print('Last page index= $onBoardingIndex');
    emit(onBoardingLastIndex());
  }

  void pageNOTLast(int index) {
    isLastPage = false;
    onBoardingIndex = index;
    print('Last page= $isLastPage');
    print('Last page index= $onBoardingIndex');
    emit(onBoardingNOTLastIndex());
  }

  String onBoardingCasheKey = 'goToLogin';
  bool submit = false;
  void noONBoard() {
    if (CasheHelper.getBoolean(key: onBoardingCasheKey) == true) {
      submit = true;
    } else {
      submit = false;
    }
  }


}
