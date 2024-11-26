import 'package:flutter/material.dart';
import 'package:todo_drift_app/domain/repositories/tasks_repository.dart';

class AddTaskViewModel with ChangeNotifier {
  final _tasksRepositoty = TasksRepository();
  final taskController = TextEditingController();
  var _isAddProcess = false;

  bool get isAddProcess => _isAddProcess;

  void addTask(int caseId) async {
    if (taskController.text.isEmpty) return;

    _isAddProcess = true;
    notifyListeners();
    await _tasksRepositoty.addTask(taskController.text, caseId);
    _isAddProcess = false;
    notifyListeners();
  }

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }
}
