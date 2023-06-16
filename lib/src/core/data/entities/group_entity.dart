import 'package:drift/drift.dart';

class Group extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get token => text().named('token')();
  TextColumn get key => text().named('key')();
  TextColumn get password => text().named('password')();
}