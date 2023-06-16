// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $GroupTable extends Group with TableInfo<$GroupTable, GroupData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroupTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
      'token', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, token, key, password];
  @override
  String get aliasedName => _alias ?? 'group';
  @override
  String get actualTableName => 'group';
  @override
  VerificationContext validateIntegrity(Insertable<GroupData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('token')) {
      context.handle(
          _tokenMeta, token.isAcceptableOrUnknown(data['token']!, _tokenMeta));
    } else if (isInserting) {
      context.missing(_tokenMeta);
    }
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GroupData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GroupData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      token: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}token'])!,
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
    );
  }

  @override
  $GroupTable createAlias(String alias) {
    return $GroupTable(attachedDatabase, alias);
  }
}

class GroupData extends DataClass implements Insertable<GroupData> {
  final int id;
  final String token;
  final String key;
  final String password;
  const GroupData(
      {required this.id,
      required this.token,
      required this.key,
      required this.password});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['token'] = Variable<String>(token);
    map['key'] = Variable<String>(key);
    map['password'] = Variable<String>(password);
    return map;
  }

  GroupCompanion toCompanion(bool nullToAbsent) {
    return GroupCompanion(
      id: Value(id),
      token: Value(token),
      key: Value(key),
      password: Value(password),
    );
  }

  factory GroupData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GroupData(
      id: serializer.fromJson<int>(json['id']),
      token: serializer.fromJson<String>(json['token']),
      key: serializer.fromJson<String>(json['key']),
      password: serializer.fromJson<String>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'token': serializer.toJson<String>(token),
      'key': serializer.toJson<String>(key),
      'password': serializer.toJson<String>(password),
    };
  }

  GroupData copyWith({int? id, String? token, String? key, String? password}) =>
      GroupData(
        id: id ?? this.id,
        token: token ?? this.token,
        key: key ?? this.key,
        password: password ?? this.password,
      );
  @override
  String toString() {
    return (StringBuffer('GroupData(')
          ..write('id: $id, ')
          ..write('token: $token, ')
          ..write('key: $key, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, token, key, password);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GroupData &&
          other.id == this.id &&
          other.token == this.token &&
          other.key == this.key &&
          other.password == this.password);
}

class GroupCompanion extends UpdateCompanion<GroupData> {
  final Value<int> id;
  final Value<String> token;
  final Value<String> key;
  final Value<String> password;
  const GroupCompanion({
    this.id = const Value.absent(),
    this.token = const Value.absent(),
    this.key = const Value.absent(),
    this.password = const Value.absent(),
  });
  GroupCompanion.insert({
    this.id = const Value.absent(),
    required String token,
    required String key,
    required String password,
  })  : token = Value(token),
        key = Value(key),
        password = Value(password);
  static Insertable<GroupData> custom({
    Expression<int>? id,
    Expression<String>? token,
    Expression<String>? key,
    Expression<String>? password,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (token != null) 'token': token,
      if (key != null) 'key': key,
      if (password != null) 'password': password,
    });
  }

  GroupCompanion copyWith(
      {Value<int>? id,
      Value<String>? token,
      Value<String>? key,
      Value<String>? password}) {
    return GroupCompanion(
      id: id ?? this.id,
      token: token ?? this.token,
      key: key ?? this.key,
      password: password ?? this.password,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroupCompanion(')
          ..write('id: $id, ')
          ..write('token: $token, ')
          ..write('key: $key, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }
}

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
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _syncMeta = const VerificationMeta('sync');
  @override
  late final GeneratedColumn<int> sync = GeneratedColumn<int>(
      'sync', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
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
    }
    if (data.containsKey('sync')) {
      context.handle(
          _syncMeta, sync.isAcceptableOrUnknown(data['sync']!, _syncMeta));
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
    this.amount = const Value.absent(),
    this.sync = const Value.absent(),
  })  : description = Value(description),
        category = Value(category);
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
      'stock', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _idGroupMeta =
      const VerificationMeta('idGroup');
  @override
  late final GeneratedColumn<int> idGroup = GeneratedColumn<int>(
      'group', aliasedName, false,
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
      'value', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, idStock, idGroup, description, cust, value, image];
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
    if (data.containsKey('stock')) {
      context.handle(_idStockMeta,
          idStock.isAcceptableOrUnknown(data['stock']!, _idStockMeta));
    } else if (isInserting) {
      context.missing(_idStockMeta);
    }
    if (data.containsKey('group')) {
      context.handle(_idGroupMeta,
          idGroup.isAcceptableOrUnknown(data['group']!, _idGroupMeta));
    } else if (isInserting) {
      context.missing(_idGroupMeta);
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
    } else if (isInserting) {
      context.missing(_valueMeta);
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
          .read(DriftSqlType.int, data['${effectivePrefix}stock'])!,
      idGroup: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}group'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      cust: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cust'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}value'])!,
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
  final int idGroup;
  final String description;
  final double cust;
  final double value;
  final String? image;
  const ProductData(
      {required this.id,
      required this.idStock,
      required this.idGroup,
      required this.description,
      required this.cust,
      required this.value,
      this.image});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['stock'] = Variable<int>(idStock);
    map['group'] = Variable<int>(idGroup);
    map['description'] = Variable<String>(description);
    map['cust'] = Variable<double>(cust);
    map['value'] = Variable<double>(value);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    return map;
  }

  ProductCompanion toCompanion(bool nullToAbsent) {
    return ProductCompanion(
      id: Value(id),
      idStock: Value(idStock),
      idGroup: Value(idGroup),
      description: Value(description),
      cust: Value(cust),
      value: Value(value),
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
      idGroup: serializer.fromJson<int>(json['idGroup']),
      description: serializer.fromJson<String>(json['description']),
      cust: serializer.fromJson<double>(json['cust']),
      value: serializer.fromJson<double>(json['value']),
      image: serializer.fromJson<String?>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idStock': serializer.toJson<int>(idStock),
      'idGroup': serializer.toJson<int>(idGroup),
      'description': serializer.toJson<String>(description),
      'cust': serializer.toJson<double>(cust),
      'value': serializer.toJson<double>(value),
      'image': serializer.toJson<String?>(image),
    };
  }

  ProductData copyWith(
          {int? id,
          int? idStock,
          int? idGroup,
          String? description,
          double? cust,
          double? value,
          Value<String?> image = const Value.absent()}) =>
      ProductData(
        id: id ?? this.id,
        idStock: idStock ?? this.idStock,
        idGroup: idGroup ?? this.idGroup,
        description: description ?? this.description,
        cust: cust ?? this.cust,
        value: value ?? this.value,
        image: image.present ? image.value : this.image,
      );
  @override
  String toString() {
    return (StringBuffer('ProductData(')
          ..write('id: $id, ')
          ..write('idStock: $idStock, ')
          ..write('idGroup: $idGroup, ')
          ..write('description: $description, ')
          ..write('cust: $cust, ')
          ..write('value: $value, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, idStock, idGroup, description, cust, value, image);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductData &&
          other.id == this.id &&
          other.idStock == this.idStock &&
          other.idGroup == this.idGroup &&
          other.description == this.description &&
          other.cust == this.cust &&
          other.value == this.value &&
          other.image == this.image);
}

class ProductCompanion extends UpdateCompanion<ProductData> {
  final Value<int> id;
  final Value<int> idStock;
  final Value<int> idGroup;
  final Value<String> description;
  final Value<double> cust;
  final Value<double> value;
  final Value<String?> image;
  const ProductCompanion({
    this.id = const Value.absent(),
    this.idStock = const Value.absent(),
    this.idGroup = const Value.absent(),
    this.description = const Value.absent(),
    this.cust = const Value.absent(),
    this.value = const Value.absent(),
    this.image = const Value.absent(),
  });
  ProductCompanion.insert({
    this.id = const Value.absent(),
    required int idStock,
    required int idGroup,
    required String description,
    required double cust,
    required double value,
    this.image = const Value.absent(),
  })  : idStock = Value(idStock),
        idGroup = Value(idGroup),
        description = Value(description),
        cust = Value(cust),
        value = Value(value);
  static Insertable<ProductData> custom({
    Expression<int>? id,
    Expression<int>? idStock,
    Expression<int>? idGroup,
    Expression<String>? description,
    Expression<double>? cust,
    Expression<double>? value,
    Expression<String>? image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idStock != null) 'stock': idStock,
      if (idGroup != null) 'group': idGroup,
      if (description != null) 'description': description,
      if (cust != null) 'cust': cust,
      if (value != null) 'value': value,
      if (image != null) 'image': image,
    });
  }

  ProductCompanion copyWith(
      {Value<int>? id,
      Value<int>? idStock,
      Value<int>? idGroup,
      Value<String>? description,
      Value<double>? cust,
      Value<double>? value,
      Value<String?>? image}) {
    return ProductCompanion(
      id: id ?? this.id,
      idStock: idStock ?? this.idStock,
      idGroup: idGroup ?? this.idGroup,
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
      map['stock'] = Variable<int>(idStock.value);
    }
    if (idGroup.present) {
      map['group'] = Variable<int>(idGroup.value);
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
          ..write('idGroup: $idGroup, ')
          ..write('description: $description, ')
          ..write('cust: $cust, ')
          ..write('value: $value, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

class $PermissionsTable extends Permissions
    with TableInfo<$PermissionsTable, Permission> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PermissionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _groupMeta = const VerificationMeta('group');
  @override
  late final GeneratedColumn<int> group = GeneratedColumn<int>(
      'group', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _pAddRemoveMeta =
      const VerificationMeta('pAddRemove');
  @override
  late final GeneratedColumn<int> pAddRemove = GeneratedColumn<int>(
      'p_add_remove', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _pCreateMeta =
      const VerificationMeta('pCreate');
  @override
  late final GeneratedColumn<int> pCreate = GeneratedColumn<int>(
      'p_create', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _pDeleteMeta =
      const VerificationMeta('pDelete');
  @override
  late final GeneratedColumn<int> pDelete = GeneratedColumn<int>(
      'p_delete', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, group, pAddRemove, pCreate, pDelete];
  @override
  String get aliasedName => _alias ?? 'permissions';
  @override
  String get actualTableName => 'permissions';
  @override
  VerificationContext validateIntegrity(Insertable<Permission> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('group')) {
      context.handle(
          _groupMeta, group.isAcceptableOrUnknown(data['group']!, _groupMeta));
    } else if (isInserting) {
      context.missing(_groupMeta);
    }
    if (data.containsKey('p_add_remove')) {
      context.handle(
          _pAddRemoveMeta,
          pAddRemove.isAcceptableOrUnknown(
              data['p_add_remove']!, _pAddRemoveMeta));
    } else if (isInserting) {
      context.missing(_pAddRemoveMeta);
    }
    if (data.containsKey('p_create')) {
      context.handle(_pCreateMeta,
          pCreate.isAcceptableOrUnknown(data['p_create']!, _pCreateMeta));
    } else if (isInserting) {
      context.missing(_pCreateMeta);
    }
    if (data.containsKey('p_delete')) {
      context.handle(_pDeleteMeta,
          pDelete.isAcceptableOrUnknown(data['p_delete']!, _pDeleteMeta));
    } else if (isInserting) {
      context.missing(_pDeleteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Permission map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Permission(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      group: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}group'])!,
      pAddRemove: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}p_add_remove'])!,
      pCreate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}p_create'])!,
      pDelete: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}p_delete'])!,
    );
  }

  @override
  $PermissionsTable createAlias(String alias) {
    return $PermissionsTable(attachedDatabase, alias);
  }
}

class Permission extends DataClass implements Insertable<Permission> {
  final int id;
  final int group;
  final int pAddRemove;
  final int pCreate;
  final int pDelete;
  const Permission(
      {required this.id,
      required this.group,
      required this.pAddRemove,
      required this.pCreate,
      required this.pDelete});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['group'] = Variable<int>(group);
    map['p_add_remove'] = Variable<int>(pAddRemove);
    map['p_create'] = Variable<int>(pCreate);
    map['p_delete'] = Variable<int>(pDelete);
    return map;
  }

  PermissionsCompanion toCompanion(bool nullToAbsent) {
    return PermissionsCompanion(
      id: Value(id),
      group: Value(group),
      pAddRemove: Value(pAddRemove),
      pCreate: Value(pCreate),
      pDelete: Value(pDelete),
    );
  }

  factory Permission.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Permission(
      id: serializer.fromJson<int>(json['id']),
      group: serializer.fromJson<int>(json['group']),
      pAddRemove: serializer.fromJson<int>(json['pAddRemove']),
      pCreate: serializer.fromJson<int>(json['pCreate']),
      pDelete: serializer.fromJson<int>(json['pDelete']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'group': serializer.toJson<int>(group),
      'pAddRemove': serializer.toJson<int>(pAddRemove),
      'pCreate': serializer.toJson<int>(pCreate),
      'pDelete': serializer.toJson<int>(pDelete),
    };
  }

  Permission copyWith(
          {int? id, int? group, int? pAddRemove, int? pCreate, int? pDelete}) =>
      Permission(
        id: id ?? this.id,
        group: group ?? this.group,
        pAddRemove: pAddRemove ?? this.pAddRemove,
        pCreate: pCreate ?? this.pCreate,
        pDelete: pDelete ?? this.pDelete,
      );
  @override
  String toString() {
    return (StringBuffer('Permission(')
          ..write('id: $id, ')
          ..write('group: $group, ')
          ..write('pAddRemove: $pAddRemove, ')
          ..write('pCreate: $pCreate, ')
          ..write('pDelete: $pDelete')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, group, pAddRemove, pCreate, pDelete);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Permission &&
          other.id == this.id &&
          other.group == this.group &&
          other.pAddRemove == this.pAddRemove &&
          other.pCreate == this.pCreate &&
          other.pDelete == this.pDelete);
}

class PermissionsCompanion extends UpdateCompanion<Permission> {
  final Value<int> id;
  final Value<int> group;
  final Value<int> pAddRemove;
  final Value<int> pCreate;
  final Value<int> pDelete;
  const PermissionsCompanion({
    this.id = const Value.absent(),
    this.group = const Value.absent(),
    this.pAddRemove = const Value.absent(),
    this.pCreate = const Value.absent(),
    this.pDelete = const Value.absent(),
  });
  PermissionsCompanion.insert({
    this.id = const Value.absent(),
    required int group,
    required int pAddRemove,
    required int pCreate,
    required int pDelete,
  })  : group = Value(group),
        pAddRemove = Value(pAddRemove),
        pCreate = Value(pCreate),
        pDelete = Value(pDelete);
  static Insertable<Permission> custom({
    Expression<int>? id,
    Expression<int>? group,
    Expression<int>? pAddRemove,
    Expression<int>? pCreate,
    Expression<int>? pDelete,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (group != null) 'group': group,
      if (pAddRemove != null) 'p_add_remove': pAddRemove,
      if (pCreate != null) 'p_create': pCreate,
      if (pDelete != null) 'p_delete': pDelete,
    });
  }

  PermissionsCompanion copyWith(
      {Value<int>? id,
      Value<int>? group,
      Value<int>? pAddRemove,
      Value<int>? pCreate,
      Value<int>? pDelete}) {
    return PermissionsCompanion(
      id: id ?? this.id,
      group: group ?? this.group,
      pAddRemove: pAddRemove ?? this.pAddRemove,
      pCreate: pCreate ?? this.pCreate,
      pDelete: pDelete ?? this.pDelete,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (group.present) {
      map['group'] = Variable<int>(group.value);
    }
    if (pAddRemove.present) {
      map['p_add_remove'] = Variable<int>(pAddRemove.value);
    }
    if (pCreate.present) {
      map['p_create'] = Variable<int>(pCreate.value);
    }
    if (pDelete.present) {
      map['p_delete'] = Variable<int>(pDelete.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PermissionsCompanion(')
          ..write('id: $id, ')
          ..write('group: $group, ')
          ..write('pAddRemove: $pAddRemove, ')
          ..write('pCreate: $pCreate, ')
          ..write('pDelete: $pDelete')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $GroupTable group = $GroupTable(this);
  late final $StockTable stock = $StockTable(this);
  late final $ProductTable product = $ProductTable(this);
  late final $PermissionsTable permissions = $PermissionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [group, stock, product, permissions];
}
