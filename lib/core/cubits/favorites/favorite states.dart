abstract class FavoriteStates {}

class FavoriteInitState extends FavoriteStates {}

class GetFavoriteLoadingState extends FavoriteStates {}

class GetFavoriteDoneState extends FavoriteStates {}

class GetFavoriteErrorState extends FavoriteStates {
  final error;

  GetFavoriteErrorState(this.error);
}

class AddFavoriteLoadingState extends FavoriteStates {}

class AddFavoriteDoneState extends FavoriteStates {}

class AddFavoriteErrorState extends FavoriteStates {
  final error;

  AddFavoriteErrorState(this.error);
}

class DeleteFavoriteLoadingState extends FavoriteStates {}

class DeleteFavoriteDoneState extends FavoriteStates {}

class DeleteFavoriteErrorState extends FavoriteStates {
  final error;

  DeleteFavoriteErrorState(this.error);
}
