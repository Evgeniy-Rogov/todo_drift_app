import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/domain/database/database.dart';
import 'package:todo_app/domain/entities/task_list_argument.dart';
import 'package:todo_app/domain/repositories/cases_repository.dart';
import 'package:todo_app/navigation/main_navigator.dart';

class ToDoListViewModel with ChangeNotifier {
  final _casesRepository = CasesRepository();
  var _cases = <Case>[];
  late final StreamSubscription<List<Case>> subscriptionCases;
  var _isLoading = false;

  ToDoListViewModel() {
    update();
    subscriptionCases =
        _casesRepository.watchCases().listen((data) => update());
  }

  List<Case> get cases => List.unmodifiable(_cases);
  bool get isLoading => _isLoading;

  void update() async {
    _isLoading = true;
    notifyListeners();
    _cases = await _casesRepository.getCases();
    _isLoading = false;
    notifyListeners();
  }

  void onAddButton(BuildContext context) {
    Navigator.of(context).pushNamed(MainNavigatorRoutesNames.addCase);
  }

  void onTapOneCaseTile(BuildContext context, TaskListArguments arguments) {
    Navigator.of(context)
        .pushNamed(MainNavigatorRoutesNames.taskList, arguments: arguments);
  }

  void onDeleteButton(int id) async {
    await _casesRepository.deleteCase(id);
  }

  void onUpdateButton(
      BuildContext context, TaskListArguments taskListArguments) {
    Navigator.of(context).pushNamed(MainNavigatorRoutesNames.editCase,
        arguments: taskListArguments);
  }

  @override
  void dispose() {
    subscriptionCases.cancel();

    super.dispose();
  }
}
