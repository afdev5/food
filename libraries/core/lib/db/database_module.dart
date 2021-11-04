import 'dart:io';

import 'package:core/db/table/food_table.dart';
import 'package:favorit/data/datasources/dao/favorit_dao.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' show getDatabasesPath;
import 'package:flutter/services.dart' show rootBundle;

part 'database_module.g.dart';

LazyDatabase _openConnection(bool isDebug) {
  return LazyDatabase(() async {
    final dbFolder = await getDatabasesPath();
    final file = File(join(dbFolder, 'db_food'));

    return FlutterQueryExecutor.inDatabaseFolder(
      path: file.path,
      logStatements: isDebug ? true : false,
    );
  });
}

@UseMoor(tables: [FoodTable], daos: [FavoritDao])
class AppDatabase extends _$AppDatabase {
  final bool isDebug;
  AppDatabase({required this.isDebug}) : super(_openConnection(isDebug));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) => m.createAll(),
      );
}
