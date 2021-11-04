
import 'package:home/domain/entities/food_entity.dart';

abstract class HomeRepositories {
  Future<List<FoodEntity>> getFood();
  Future<List<FoodEntity>> getFoodWithCategory({required String category});
}