import 'package:detail/domain/repositories/detail_repositories.dart';
import 'package:home/domain/entities/food_entity.dart';

abstract class DetailUseCase {
  Future<FoodEntity> getFoodDetail({required String id});
  Future insertFavoritFood({required FoodEntity food});
  Future removeFavoritFood({required String id});
}

class DetailUseCaseImpl extends DetailUseCase {
  final DetailRepositories repositories;
  DetailUseCaseImpl({required this.repositories});
  @override
  Future<FoodEntity> getFoodDetail({required String id}) async =>
      await repositories.getFoodDetail(id: id);

  @override
  Future insertFavoritFood({required FoodEntity food}) async => await repositories.insertFavoritFood(food: food);

  @override
  Future removeFavoritFood({required String id}) async => await repositories.removeFavoritFood(id: id);
}
