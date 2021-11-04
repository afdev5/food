// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_module.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class FoodTableData extends DataClass implements Insertable<FoodTableData> {
  final String id;
  final String title;
  final String image;
  final String desc;
  FoodTableData(
      {required this.id,
      required this.title,
      required this.image,
      required this.desc});
  factory FoodTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return FoodTableData(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image'])!,
      desc: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}desc'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['image'] = Variable<String>(image);
    map['desc'] = Variable<String>(desc);
    return map;
  }

  FoodTableCompanion toCompanion(bool nullToAbsent) {
    return FoodTableCompanion(
      id: Value(id),
      title: Value(title),
      image: Value(image),
      desc: Value(desc),
    );
  }

  factory FoodTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FoodTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      image: serializer.fromJson<String>(json['image']),
      desc: serializer.fromJson<String>(json['desc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'image': serializer.toJson<String>(image),
      'desc': serializer.toJson<String>(desc),
    };
  }

  FoodTableData copyWith(
          {String? id, String? title, String? image, String? desc}) =>
      FoodTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        image: image ?? this.image,
        desc: desc ?? this.desc,
      );
  @override
  String toString() {
    return (StringBuffer('FoodTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('desc: $desc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, image, desc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FoodTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.image == this.image &&
          other.desc == this.desc);
}

class FoodTableCompanion extends UpdateCompanion<FoodTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> image;
  final Value<String> desc;
  const FoodTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.image = const Value.absent(),
    this.desc = const Value.absent(),
  });
  FoodTableCompanion.insert({
    required String id,
    required String title,
    required String image,
    required String desc,
  })  : id = Value(id),
        title = Value(title),
        image = Value(image),
        desc = Value(desc);
  static Insertable<FoodTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? image,
    Expression<String>? desc,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (image != null) 'image': image,
      if (desc != null) 'desc': desc,
    });
  }

  FoodTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? image,
      Value<String>? desc}) {
    return FoodTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      desc: desc ?? this.desc,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('desc: $desc')
          ..write(')'))
        .toString();
  }
}

class $FoodTableTable extends FoodTable
    with TableInfo<$FoodTableTable, FoodTableData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $FoodTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _descMeta = const VerificationMeta('desc');
  late final GeneratedColumn<String?> desc = GeneratedColumn<String?>(
      'desc', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, image, desc];
  @override
  String get aliasedName => _alias ?? 'FOOD_TABLE';
  @override
  String get actualTableName => 'FOOD_TABLE';
  @override
  VerificationContext validateIntegrity(Insertable<FoodTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc']!, _descMeta));
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  FoodTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return FoodTableData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $FoodTableTable createAlias(String alias) {
    return $FoodTableTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $FoodTableTable foodTable = $FoodTableTable(this);
  late final FavoritDao favoritDao = FavoritDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [foodTable];
}
