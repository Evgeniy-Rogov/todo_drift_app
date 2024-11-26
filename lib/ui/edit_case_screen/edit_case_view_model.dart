import 'package:flutter/material.dart';
import 'package:todo_app/domain/entities/task_list_argument.dart';
import 'package:todo_app/domain/repositories/cases_repository.dart';

class EditCaseViewModel with ChangeNotifier {
  final _casesRepository = CasesRepository();
  late TextEditingController editCaseController;
  var _isUpdateProcess = false;
  final TaskListArguments taskListArguments;

  EditCaseViewModel(this.taskListArguments) {
    editCaseController = TextEditingController(text: taskListArguments.title);
  }

  bool get isUpdateProcess => _isUpdateProcess;

  void updateCase() async {
    final text = editCaseController.text;
    if (text.isEmpty) return;
    if (text == taskListArguments.title) return;

    _isUpdateProcess = true;
    notifyListeners();
    await _casesRepository.updateCase(taskListArguments.caseId, text);
    _isUpdateProcess = false;
    notifyListeners();
  }

  @override
  void dispose() {
    editCaseController.dispose();
    super.dispose();
  }
}
