import 'package:drift/drift.dart';

class Product extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idStock => integer().named('idStock')();
  TextColumn get description => text().named('description')();
  RealColumn get cust => real().named('cust')();
  RealColumn get value => real().named('value').nullable()();
  TextColumn get image => text().named('image').nullable()();
}