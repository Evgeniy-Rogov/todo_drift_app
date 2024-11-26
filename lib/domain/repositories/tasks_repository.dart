import 'package:drift/drift.dart';
import 'package:todo_app/domain/database/database.dart';

abstract class AbstractTasksRepository {
  Future<List<Task>> getTasks(int caseId);
  Future<void> deleteTask(int id);
  Future<void> addTask(String body, int caseId);
  Stream<List<Task>> watchTasksInCase(int caseId);
  Future<void> updateTask(int id, String body);
}

class TasksRepository implements AbstractTasksRepository {
  final db = Database();

  @override
  Future<List<Task>> getTasks(int caseId) {
    return (db.select(db.tasks)..where((entry) => entry.caseId.equals(caseId)))
        .get();
  }

  @override
  Future<void> deleteTask(int id) {
    return (db.delete(db.tasks)..where((entry) => entry.id.equals(id))).go();
  }

  @override
  Future<void> addTask(String body, int caseId) {
    return db.into(db.tasks).insert(TasksCompanion.insert(
          body: body,
          caseId: caseId,
        ));
  }

  @override
  Stream<List<Task>> watchTasksInCase(int caseId) {
    return (db.select(db.tasks)..where((entry) => entry.caseId.equals(caseId)))
        .watch();
  }

  @override
  Future<void> updateTask(int id, String body) {
    return (db.update(db.tasks)..where((entry) => entry.id.equals(id)))
        .write(TasksCompanion(body: Value(body)));
  }
}
