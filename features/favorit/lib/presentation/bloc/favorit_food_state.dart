part of 'favorit_food_cubit.dart';

@immutable
abstract class FavoritFoodState{}

class FoodInitial extends FavoritFoodState{}

class LoadingFavoritFoodState extends FavoritFoodState{}

class SuccessFavoritFoodState extends FavoritFoodState{
  final List<FoodEntity> datas;
  SuccessFavoritFoodState({required this.datas});
}

class EmptyFavoritFoodState extends FavoritFoodState{}

class Error extends FavoritFoodState{
  final String message;
  Error({required this.message});
}
