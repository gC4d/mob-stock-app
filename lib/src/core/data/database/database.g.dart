// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $StockTable extends Stock with TableInfo<$StockTable, StockData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StockTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<int> category = GeneratedColumn<int>(
      'category', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _syncMeta = const VerificationMeta('sync');
  @override
  late final GeneratedColumn<int> sync = GeneratedColumn<int>(
      'sync', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, description, category, amount, sync];
  @override
  String get aliasedName => _alias ?? 'stock';
  @override
  String get actualTableName => 'stock';
  @override
  VerificationContext validateIntegrity(Insertable<StockData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('sync')) {
      context.handle(
          _syncMeta, sync.isAcceptableOrUnknown(data['sync']!, _syncMeta));
    } else if (isInserting) {
      context.missing(_syncMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StockData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StockData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      sync: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sync'])!,
    );
  }

  @override
  $StockTable createAlias(String alias) {
    return $StockTable(attachedDatabase, alias);
  }
}

class StockData extends DataClass implements Insertable<StockData> {
  final int id;
  final String description;
  final int category;
  final int amount;
  final int sync;
  const StockData(
      {required this.id,
      required this.description,
      required this.category,
      required this.amount,
      required this.sync});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    map['category'] = Variable<int>(category);
    map['amount'] = Variable<int>(amount);
    map['sync'] = Variable<int>(sync);
    return map;
  }

  StockCompanion toCompanion(bool nullToAbsent) {
    return StockCompanion(
      id: Value(id),
      description: Value(description),
      category: Value(category),
      amount: Value(amount),
      sync: Value(sync),
    );
  }

  factory StockData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StockData(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      category: serializer.fromJson<int>(json['category']),
      amount: serializer.fromJson<int>(json['amount']),
      sync: serializer.fromJson<int>(json['sync']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
      'category': serializer.toJson<int>(category),
      'amount': serializer.toJson<int>(amount),
      'sync': serializer.toJson<int>(sync),
    };
  }

  StockData copyWith(
          {int? id,
          String? description,
          int? category,
          int? amount,
          int? sync}) =>
      StockData(
        id: id ?? this.id,
        description: description ?? this.description,
        category: category ?? this.category,
        amount: amount ?? this.amount,
        sync: sync ?? this.sync,
      );
  @override
  String toString() {
    return (StringBuffer('StockData(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('amount: $amount, ')
          ..write('sync: $sync')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description, category, amount, sync);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StockData &&
          other.id == this.id &&
          other.description == this.description &&
          other.category == this.category &&
          other.amount == this.amount &&
          other.sync == this.sync);
}

class StockCompanion extends UpdateCompanion<StockData> {
  final Value<int> id;
  final Value<String> description;
  final Value<int> category;
  final Value<int> amount;
  final Value<int> sync;
  const StockCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.amount = const Value.absent(),
    this.sync = const Value.absent(),
  });
  StockCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    required int category,
    required int amount,
    required int sync,
  })  : description = Value(description),
        category = Value(category),
        amount = Value(amount),
        sync = Value(sync);
  static Insertable<StockData> custom({
    Expression<int>? id,
    Expression<String>? description,
    Expression<int>? category,
    Expression<int>? amount,
    Expression<int>? sync,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (amount != null) 'amount': amount,
      if (sync != null) 'sync': sync,
    });
  }

  StockCompanion copyWith(
      {Value<int>? id,
      Value<String>? description,
      Value<int>? category,
      Value<int>? amount,
      Value<int>? sync}) {
    return StockCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      category: category ?? this.category,
      amount: amount ?? this.amount,
      sync: sync ?? this.sync,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (sync.present) {
      map['sync'] = Variable<int>(sync.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StockCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('amount: $amount, ')
          ..write('sync: $sync')
          ..write(')'))
        .toString();
  }
}

class $ProductTable extends Product with TableInfo<$ProductTable, ProductData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idStockMeta =
      const VerificationMeta('idStock');
  @override
  late final GeneratedColumn<int> idStock = GeneratedColumn<int>(
      'idStock', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _custMeta = const VerificationMeta('cust');
  @override
  late final GeneratedColumn<double> cust = GeneratedColumn<double>(
      'cust', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double> value = GeneratedColumn<double>(
      'value', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, idStock, description, cust, value, image];
  @override
  String get aliasedName => _alias ?? 'product';
  @override
  String get actualTableName => 'product';
  @override
  VerificationContext validateIntegrity(Insertable<ProductData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('idStock')) {
      context.handle(_idStockMeta,
          idStock.isAcceptableOrUnknown(data['idStock']!, _idStockMeta));
    } else if (isInserting) {
      context.missing(_idStockMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('cust')) {
      context.handle(
          _custMeta, cust.isAcceptableOrUnknown(data['cust']!, _custMeta));
    } else if (isInserting) {
      context.missing(_custMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      idStock: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}idStock'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      cust: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cust'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}value']),
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
    );
  }

  @override
  $ProductTable createAlias(String alias) {
    return $ProductTable(attachedDatabase, alias);
  }
}

class ProductData extends DataClass implements Insertable<ProductData> {
  final int id;
  final int idStock;
  final String description;
  final double cust;
  final double? value;
  final String? image;
  const ProductData(
      {required this.id,
      required this.idStock,
      required this.description,
      required this.cust,
      this.value,
      this.image});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['idStock'] = Variable<int>(idStock);
    map['description'] = Variable<String>(description);
    map['cust'] = Variable<double>(cust);
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<double>(value);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    return map;
  }

  ProductCompanion toCompanion(bool nullToAbsent) {
    return ProductCompanion(
      id: Value(id),
      idStock: Value(idStock),
      description: Value(description),
      cust: Value(cust),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
    );
  }

  factory ProductData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductData(
      id: serializer.fromJson<int>(json['id']),
      idStock: serializer.fromJson<int>(json['idStock']),
      description: serializer.fromJson<String>(json['description']),
      cust: serializer.fromJson<double>(json['cust']),
      value: serializer.fromJson<double?>(json['value']),
      image: serializer.fromJson<String?>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idStock': serializer.toJson<int>(idStock),
      'description': serializer.toJson<String>(description),
      'cust': serializer.toJson<double>(cust),
      'value': serializer.toJson<double?>(value),
      'image': serializer.toJson<String?>(image),
    };
  }

  ProductData copyWith(
          {int? id,
          int? idStock,
          String? description,
          double? cust,
          Value<double?> value = const Value.absent(),
          Value<String?> image = const Value.absent()}) =>
      ProductData(
        id: id ?? this.id,
        idStock: idStock ?? this.idStock,
        description: description ?? this.description,
        cust: cust ?? this.cust,
        value: value.present ? value.value : this.value,
        image: image.present ? image.value : this.image,
      );
  @override
  String toString() {
    return (StringBuffer('ProductData(')
          ..write('id: $id, ')
          ..write('idStock: $idStock, ')
          ..write('description: $description, ')
          ..write('cust: $cust, ')
          ..write('value: $value, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, idStock, description, cust, value, image);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductData &&
          other.id == this.id &&
          other.idStock == this.idStock &&
          other.description == this.description &&
          other.cust == this.cust &&
          other.value == this.value &&
          other.image == this.image);
}

class ProductCompanion extends UpdateCompanion<ProductData> {
  final Value<int> id;
  final Value<int> idStock;
  final Value<String> description;
  final Value<double> cust;
  final Value<double?> value;
  final Value<String?> image;
  const ProductCompanion({
    this.id = const Value.absent(),
    this.idStock = const Value.absent(),
    this.description = const Value.absent(),
    this.cust = const Value.absent(),
    this.value = const Value.absent(),
    this.image = const Value.absent(),
  });
  ProductCompanion.insert({
    this.id = const Value.absent(),
    required int idStock,
    required String description,
    required double cust,
    this.value = const Value.absent(),
    this.image = const Value.absent(),
  })  : idStock = Value(idStock),
        description = Value(description),
        cust = Value(cust);
  static Insertable<ProductData> custom({
    Expression<int>? id,
    Expression<int>? idStock,
    Expression<String>? description,
    Expression<double>? cust,
    Expression<double>? value,
    Expression<String>? image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idStock != null) 'idStock': idStock,
      if (description != null) 'description': description,
      if (cust != null) 'cust': cust,
      if (value != null) 'value': value,
      if (image != null) 'image': image,
    });
  }

  ProductCompanion copyWith(
      {Value<int>? id,
      Value<int>? idStock,
      Value<String>? description,
      Value<double>? cust,
      Value<double?>? value,
      Value<String?>? image}) {
    return ProductCompanion(
      id: id ?? this.id,
      idStock: idStock ?? this.idStock,
      description: description ?? this.description,
      cust: cust ?? this.cust,
      value: value ?? this.value,
      image: image ?? this.image,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idStock.present) {
      map['idStock'] = Variable<int>(idStock.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (cust.present) {
      map['cust'] = Variable<double>(cust.value);
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductCompanion(')
          ..write('id: $id, ')
          ..write('idStock: $idStock, ')
          ..write('description: $description, ')
          ..write('cust: $cust, ')
          ..write('value: $value, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $StockTable stock = $StockTable(this);
  late final $ProductTable product = $ProductTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [stock, product];
}
