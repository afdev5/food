import 'package:home/domain/entities/food_entity.dart';

abstract class DetailRepositories {
  Future<FoodEntity> getFoodDetail({required String id});
  // Future<FoodEntity?> getFavoritFood({required String id});
  Future insertFavoritFood({required FoodEntity food});
  Future removeFavoritFood({required String id});
}
