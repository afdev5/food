import 'package:core/db/database_module.dart';

abstract class LocalDetailDataSource {
  Future insertFavoritFood({required FoodTableData food});
  Future removeFavoritFood({required String id});
  Future<FoodTableData?> getFavoritFood({required String id});
}

class LocalDetailDataSourceImpl extends LocalDetailDataSource {
  final AppDatabase database;
  LocalDetailDataSourceImpl({required this.database});

  @override
  Future<FoodTableData?> getFavoritFood({required String id}) async => await database.favoritDao.getFood(id: id);

  @override
  Future insertFavoritFood({required FoodTableData food}) async => await database.favoritDao.insertFood(food: food);

  @override
  Future removeFavoritFood({required String id}) async => await database.favoritDao.deleteFood(id: id);

}