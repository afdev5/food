// import 'package:moor_flutter/moor_flutter.dart';
// part 'moor_database.g.dart';

// class DbFoods extends Table {
//   TextColumn get id => text()();
//   TextColumn get title => text()();
//   TextColumn get image => text()();
//   TextColumn get desc => text()();
// }

// @UseMoor(tables: [DbFoods])
// class AppDatabase extends _$AppDatabase {
//   AppDatabase()
//       : super(FlutterQueryExecutor.inDatabaseFolder(
//             path: 'dbmoor.sqlite', logStatements: true));
//   @override
//   int get schemaVersion => 1;

//   Future<List<DbFood>> getAllFoods() => select(dbFoods).get();
//   Future insertFood(DbFood food) => into(dbFoods).insert(food);
//   Future deleteFood(String id) =>
//       (delete(dbFoods)..where((a) => a.id.equals(id))).go();
//   Future<DbFood> getFood(String id) =>
//       (select(dbFoods)..where((a) => a.id.equals(id))).getSingleOrNull();
// }
