import 'package:drift/drift.dart';

class Permissions extends Table{
  IntColumn get id => integer().autoIncrement()();
  IntColumn get group => integer().named('group')();
  IntColumn get pAddRemove => integer().named('p_add_remove')();
  IntColumn get pCreate => integer().named('p_create')();
  IntColumn get pDelete => integer().named('p_delete')();
} 