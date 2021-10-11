// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class DbFood extends DataClass implements Insertable<DbFood> {
  final String id;
  final String title;
  final String image;
  final String desc;
  DbFood(
      {@required this.id,
      @required this.title,
      @required this.image,
      @required this.desc});
  factory DbFood.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbFood(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title']),
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image']),
      desc: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}desc']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || desc != null) {
      map['desc'] = Variable<String>(desc);
    }
    return map;
  }

  DbFoodsCompanion toCompanion(bool nullToAbsent) {
    return DbFoodsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      desc: desc == null && nullToAbsent ? const Value.absent() : Value(desc),
    );
  }

  factory DbFood.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DbFood(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      image: serializer.fromJson<String>(json['image']),
      desc: serializer.fromJson<String>(json['desc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'image': serializer.toJson<String>(image),
      'desc': serializer.toJson<String>(desc),
    };
  }

  DbFood copyWith({String id, String title, String image, String desc}) =>
      DbFood(
        id: id ?? this.id,
        title: title ?? this.title,
        image: image ?? this.image,
        desc: desc ?? this.desc,
      );
  @override
  String toString() {
    return (StringBuffer('DbFood(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('desc: $desc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(title.hashCode, $mrjc(image.hashCode, desc.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbFood &&
          other.id == this.id &&
          other.title == this.title &&
          other.image == this.image &&
          other.desc == this.desc);
}

class DbFoodsCompanion extends UpdateCompanion<DbFood> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> image;
  final Value<String> desc;
  const DbFoodsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.image = const Value.absent(),
    this.desc = const Value.absent(),
  });
  DbFoodsCompanion.insert({
    @required String id,
    @required String title,
    @required String image,
    @required String desc,
  })  : id = Value(id),
        title = Value(title),
        image = Value(image),
        desc = Value(desc);
  static Insertable<DbFood> custom({
    Expression<String> id,
    Expression<String> title,
    Expression<String> image,
    Expression<String> desc,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (image != null) 'image': image,
      if (desc != null) 'desc': desc,
    });
  }

  DbFoodsCompanion copyWith(
      {Value<String> id,
      Value<String> title,
      Value<String> image,
      Value<String> desc}) {
    return DbFoodsCompanion(
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
    return (StringBuffer('DbFoodsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('desc: $desc')
          ..write(')'))
        .toString();
  }
}

class $DbFoodsTable extends DbFoods with TableInfo<$DbFoodsTable, DbFood> {
  final GeneratedDatabase _db;
  final String _alias;
  $DbFoodsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _imageMeta = const VerificationMeta('image');
  GeneratedTextColumn _image;
  @override
  GeneratedTextColumn get image => _image ??= _constructImage();
  GeneratedTextColumn _constructImage() {
    return GeneratedTextColumn(
      'image',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descMeta = const VerificationMeta('desc');
  GeneratedTextColumn _desc;
  @override
  GeneratedTextColumn get desc => _desc ??= _constructDesc();
  GeneratedTextColumn _constructDesc() {
    return GeneratedTextColumn(
      'desc',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, title, image, desc];
  @override
  $DbFoodsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'db_foods';
  @override
  final String actualTableName = 'db_foods';
  @override
  VerificationContext validateIntegrity(Insertable<DbFood> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image'], _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc'], _descMeta));
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  DbFood map(Map<String, dynamic> data, {String tablePrefix}) {
    return DbFood.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbFoodsTable createAlias(String alias) {
    return $DbFoodsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $DbFoodsTable _dbFoods;
  $DbFoodsTable get dbFoods => _dbFoods ??= $DbFoodsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dbFoods];
}
