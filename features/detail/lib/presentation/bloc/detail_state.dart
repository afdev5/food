part of 'detail_bloc.dart';

@immutable
abstract class DetailState {}

class DetailInitial extends DetailState {}

class LoadingDetailState extends DetailState {}

class SuccessDetailState extends DetailState {
  final FoodEntity data;
  SuccessDetailState({required this.data});
}

class NoInternetConnection extends DetailState {
  final String message;
  NoInternetConnection({required this.message});
}

class Error extends DetailState {
  final String message;
  Error({required this.message});
}
