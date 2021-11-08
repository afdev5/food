part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent {}

class GetFood extends DetailEvent {
  final String id;
  GetFood({required this.id});
}

class InsertAndDeleteFavorit extends DetailEvent {
  final FoodEntity food;
  InsertAndDeleteFavorit({required this.food});
}
