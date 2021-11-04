import 'package:equatable/equatable.dart';
import 'package:home/domain/entities/food_entity.dart';

class FoodResponseEntity extends Equatable {
  final List<FoodEntity> data;
  final bool error;
  final String message;

  const FoodResponseEntity(
      {required this.data, required this.error, required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [data, error, message];
}
