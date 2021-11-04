
import 'package:favorit/domain/repositories/favorit_reporitories.dart';
import 'package:home/domain/entities/food_entity.dart';

abstract class FavoritUseCase {
  Future<List<FoodEntity>> getFavoritFood();
}

class FavoritUseCaseImpl extends FavoritUseCase {
  final FavoritRepositories repositories;
  FavoritUseCaseImpl({required this.repositories});
  @override
  Future<List<FoodEntity>> getFavoritFood() async => await repositories.getFavoritFood();

}