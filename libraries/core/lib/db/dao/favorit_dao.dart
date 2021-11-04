import 'package:core/db/database_module.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:core/db/table/food_table.dart';

part 'favorit_dao.g.dart';

@UseDao(tables: [FoodTable])
class FavoritDao extends DatabaseAccessor<AppDatabase> with _$FavoritDaoMixin {
  FavoritDao(AppDatabase db) : super(db);
  Future<List<FoodTableData>> getAllFoods() => select(foodTable).get();
  Future<FoodTableData?> getFood({required String id}) =>
      (select(foodTable)..where((a) => a.id.equals(id))).getSingleOrNull();
  Future insertFood({required FoodTableData food}) =>
      into(foodTable).insert(food);
  Future deleteFood({required String id}) =>
      (delete(foodTable)..where((a) => a.id.equals(id))).go();
}
