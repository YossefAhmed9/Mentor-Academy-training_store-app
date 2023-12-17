import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy/core/network/local/shared_prefrence.dart';
import 'package:mentor_academy/core/network/remote/dio_helper.dart';
import 'package:mentor_academy/favorites/favorite%20states.dart';

import '../core/network/constants.dart';

class FavoriteCubit extends Cubit<FavoriteStates> {
  FavoriteCubit() : super(FavoriteInitState());

  static FavoriteCubit get(context) => BlocProvider.of(context);

  List favoriteList = [];
  var FavValue;

  Future<void> getFavorites() async {
    emit(GetFavoriteLoadingState());
    await DioHelper.getData(url: ApiConstants().favoriteCartApi, data: {
      "nationalId": CasheHelper.getBoolean(key: 'nationalId'),
    }).then((value) {
      favoriteList.addAll(value.data['favoriteProducts']);
      FavValue = value.data;
      emit(GetFavoriteDoneState());
      print(value.data);
      print("this is token ${CasheHelper.getBoolean(key: 'token')}");
    }).catchError((error) {
      emit(GetFavoriteErrorState(error));
      print(error.toString());
      print(error.runtimeType);
    });
  }

  Future<void> deleteFromFavorites({required productId}) async {
    emit(DeleteFavoriteLoadingState());
    await DioHelper.delData(url: ApiConstants().favoriteCartApi, data: {
      "nationalId": CasheHelper.getBoolean(key: 'nationalId'),
      "productId": productId
    }).then((value) {
      getFavorites();
      favoriteList.remove(value.data);
      emit(DeleteFavoriteDoneState());
      print(value.data);
    }).catchError((error) {
      emit(DeleteFavoriteErrorState(error));
      print(error.toString());
      print(error.runtimeType);
    });
  }

  Future<void> addToFavorite({required productId}) async {
    emit(AddFavoriteLoadingState());
    getFavorites();
    await DioHelper.postData(url: ApiConstants().favoriteCartApi, data: {
      "nationalId": CasheHelper.getBoolean(key: 'nationalId'),
      "productId": productId
    }).then((value) {
      getFavorites();
      favoriteList.add(value.data);
      emit(AddFavoriteDoneState());
      print(value.data);
    }).catchError((error) {
      emit(AddFavoriteErrorState(error));
      print(error.toString());
      print(error.runtimeType);
    });
  }
}
