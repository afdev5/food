part of 'favorit_bloc.dart';

@immutable
abstract class FavoritState {}

class FavoritInitial extends FavoritState {}

class LoadingFavoritState extends FavoritState{}

class SuccessFavoritState extends FavoritState{
  final List<FoodEntity> datas;
  SuccessFavoritState({required this.datas});
}

class EmptyFavoritState extends FavoritState{}

class Error extends FavoritState{
  final String message;
  Error({required this.message});
}