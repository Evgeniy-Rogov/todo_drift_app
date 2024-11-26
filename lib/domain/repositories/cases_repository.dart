import 'package:drift/drift.dart';
import 'package:todo_drift_app/domain/database/database.dart';

abstract class AbstractCasesRepository {
  Future<List<Case>> getCases();
  Future<void> deleteCase(int id);
  Future<void> addCase(String title);
  Stream<List<Case>> watchCases();
  Future<void> updateCase(int id, String title);
}

class CasesRepository implements AbstractCasesRepository {
  final db = Database();

  @override
  Future<List<Case>> getCases() {
    return db.select(db.cases).get();
  }

  @override
  Future<void> deleteCase(int id) {
    return (db.delete(db.cases)..where((entry) => entry.id.equals(id))).go();
  }

  @override
  Future<void> addCase(String title) {
    return db.into(db.cases).insert(CasesCompanion.insert(title: title));
  }

  @override
  Stream<List<Case>> watchCases() {
    return db.select(db.cases).watch();
  }

  @override
  Future<void> updateCase(int id, String title) {
    return (db.update(db.cases)..where((entry) => entry.id.equals(id)))
        .write(CasesCompanion(title: Value(title)));
  }
}
