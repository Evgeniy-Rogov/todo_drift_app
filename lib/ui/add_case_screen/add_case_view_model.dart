import 'package:flutter/material.dart';
import 'package:todo_drift_app/domain/repositories/cases_repository.dart';

class AddCaseViewModel with ChangeNotifier {
  final _casesRepository = CasesRepository();
  final caseController = TextEditingController();
  var _isAddProcess = false;

  bool get isAddProcess => _isAddProcess;

  void addCase() async {
    if (caseController.text.isEmpty) return;

    _isAddProcess = true;
    notifyListeners();
    await _casesRepository.addCase(caseController.text);
    _isAddProcess = false;
    notifyListeners();
  }

  @override
  void dispose() {
    caseController.dispose();
    super.dispose();
  }
}
