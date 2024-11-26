import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

class Cases extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
}

@TableIndex(name: 'task_case_id', columns: {#caseId})
class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get body => text()();
  IntColumn get caseId =>
      integer().references(Cases, #id, onDelete: KeyAction.cascade)();
}

@DriftDatabase(tables: [Cases, Tasks])
class Database extends _$Database {
  static final _instance = Database._internal();
  Database._internal() : super(_openConnection());

  factory Database() => _instance;

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'todo_drift_app_database');
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }
}
