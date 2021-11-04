import 'package:core/db/database_module.dart';

abstract class LocalFavoritDataSource {
  Future<List<FoodTableData>> getFavoritFood();
}

class LocalFavoritDataSourceImpl extends LocalFavoritDataSource {
  final AppDatabase database;
  LocalFavoritDataSourceImpl({required this.database});
  @override
  Future<List<FoodTableData>> getFavoritFood() async => await database.favoritDao.getAllFoods();

}