import 'package:home/domain/entities/food_entity.dart';

abstract class DetailRepositories {
  Future<FoodEntity> getFoodDetail({required String id});
}