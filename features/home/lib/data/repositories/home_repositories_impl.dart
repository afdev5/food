import 'package:home/data/datasources/remote_home_data_source.dart';
import 'package:home/domain/entities/food_entity.dart';
import 'package:home/domain/repositories/home_repositories.dart';

class HomeRepositoriesImpl extends HomeRepositories {
  final RemoteHomeDataSource remoteDataSource;
  HomeRepositoriesImpl({required this.remoteDataSource});

  @override
  Future<List<FoodEntity>> getFood() async {
    List<FoodEntity> foodEntity = [];
    final foods = await remoteDataSource.getFood();

    foods.data.forEach((e) {
      var food = FoodEntity(
          id: e.id!, title: e.title!, desc: e.desc!, image: e.image!);
      foodEntity.add(food);
    });
    return foodEntity;
  }

  @override
  Future<List<FoodEntity>> getFoodWithCategory({required String category}) async {
    List<FoodEntity> foodEntity = [];
    final foods = await remoteDataSource.getFoodWithCategory(category: category);
    foods.data.forEach((e) {
      var food = FoodEntity(
          id: e.id!, title: e.title!, desc: e.desc ?? "", image: e.image ?? "");
      foodEntity.add(food);
    });
    return foodEntity;
  }
}
