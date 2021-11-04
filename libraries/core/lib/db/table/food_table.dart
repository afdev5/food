import 'package:moor_flutter/moor_flutter.dart';
class FoodTable extends Table {
@override
  String get tableName => 'FOOD_TABLE';
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get image => text()();
  TextColumn get desc => text()();
}