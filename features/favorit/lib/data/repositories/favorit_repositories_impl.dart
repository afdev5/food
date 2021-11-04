
import 'package:favorit/data/datasources/local_favorit_data_source.dart';
import 'package:favorit/domain/repositories/favorit_reporitories.dart';
import 'package:home/domain/entities/food_entity.dart';

class FavoritRepositoriesImpl extends FavoritRepositories {
  final LocalFavoritDataSource localDataSource;
  FavoritRepositoriesImpl({required this.localDataSource});
  @override
  Future<List<FoodEntity>> getFavoritFood() async {
    List<FoodEntity> data = [];
    final favoritFood = await localDataSource.getFavoritFood();
    favoritFood.forEach((e) {
      data.add(FoodEntity(id: e.id, title: e.title, desc: e.desc, image: e.image));
    });
    return data;
  }

}