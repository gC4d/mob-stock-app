import 'package:drift/drift.dart';

class Stock extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text().named('description')();
  IntColumn get category => integer().named('category')();
  IntColumn get amount => integer().named('amount')();
  IntColumn get sync => integer().named('sync')();
} 