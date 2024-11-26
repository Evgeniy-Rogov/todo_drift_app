import 'package:flutter/material.dart';
import 'package:todo_drift_app/domain/entities/edit_task_screen_data.dart';
import 'package:todo_drift_app/domain/repositories/tasks_repository.dart';

class EditTaskViewModel with ChangeNotifier {
  final _tasksRepository = TasksRepository();
  late TextEditingController editTaskController;
  var _isUpdateProcess = false;
  final EditTaskScreenData data;

  EditTaskViewModel(this.data) {
    editTaskController = TextEditingController(text: data.body);
  }

  bool get isUpdateProcess => _isUpdateProcess;

  void updateTask() async {
    final text = editTaskController.text;
    if (text.isEmpty) return;
    if (text == data.body) return;

    _isUpdateProcess = true;
    notifyListeners();
    await _tasksRepository.updateTask(data.id, text);
    _isUpdateProcess = false;
    notifyListeners();
  }

  @override
  void dispose() {
    editTaskController.dispose();
    super.dispose();
  }
}
