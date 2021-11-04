part of 'detail_food_cubit.dart';

@immutable
abstract class DetailFoodState {}

class FoodInitial extends DetailFoodState {}

class LoadingDetailFoodState extends DetailFoodState {}

class SuccessDetailFoodState extends DetailFoodState {
  final FoodEntity data;
  SuccessDetailFoodState({required this.data});
}

class NoInternetConnection extends DetailFoodState {
  final String message;
  NoInternetConnection({required this.message});
}

class Error extends DetailFoodState {
  final String message;
  Error({required this.message});
}
