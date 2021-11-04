part of 'food_cubit.dart';

@immutable
abstract class FoodState {}

class FoodInitial extends FoodState {}

class LoadingFoodState extends FoodState {}

class SuccessFoodsState extends FoodState {
  final List<FoodEntity> datas;
  SuccessFoodsState({required this.datas});
}

class NoInternetConnection extends FoodState {
  final String message;
  NoInternetConnection({required this.message});
}

class Error extends FoodState {
  final String message;
  Error({required this.message});
}
