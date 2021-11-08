part of 'food_bloc.dart';

@immutable
abstract class FoodEvent {}

class GetFoodsEvent extends FoodEvent {
  final String? category;
  GetFoodsEvent({this.category});
}
