part of 'food_cubit.dart';

@immutable
abstract class FoodState {}

class FoodInitial extends FoodState {}

class LoadingFoodState extends FoodState {}

class SuccessFavoritState extends FoodState {}

class SuccessFoodsState extends FoodState {
  final List<FoodModel> datas;
  SuccessFoodsState({this.datas});
}

class SuccessFoodState extends FoodState {
  final FoodModel data;
  SuccessFoodState({this.data});
}
