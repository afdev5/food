
import 'package:home/domain/entities/food_entity.dart';

abstract class FavoritRepositories {
  Future<List<FoodEntity>> getFavoritFood();
}