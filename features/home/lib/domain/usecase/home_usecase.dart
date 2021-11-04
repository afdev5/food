import 'package:home/domain/entities/food_entity.dart';
import 'package:home/domain/repositories/home_repositories.dart';

abstract class HomeUseCase {
  Future<List<FoodEntity>> getFood();
  Future<List<FoodEntity>> getFoodWithCategory({required String category});
}

class HomeUseCaseImpl extends HomeUseCase {
  final HomeRepositories repositories;
  HomeUseCaseImpl({required this.repositories});

  @override
  Future<List<FoodEntity>> getFood() async => await repositories.getFood();

  @override
  Future<List<FoodEntity>> getFoodWithCategory(
          {required String category}) async =>
      await repositories.getFoodWithCategory(category: category);
}
