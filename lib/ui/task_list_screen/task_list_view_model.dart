import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/domain/database/database.dart';
import 'package:todo_app/domain/entities/edit_task_screen_data.dart';
import 'package:todo_app/domain/repositories/tasks_repository.dart';
import 'package:todo_app/navigation/main_navigator.dart';

class TaskListViewModel with ChangeNotifier {
  final int caseId;
  final _tasksRepository = TasksRepository();
  var _tasks = <Task>[];
  var _isStrikedList = <bool>[];
  late final StreamSubscription<List<Task>> subscriptionTasks;
  var _isLoading = false;

  TaskListViewModel(this.caseId) {
    update(caseId);
    subscriptionTasks = _tasksRepository
        .watchTasksInCase(caseId)
        .listen((data) => update(caseId));
  }

  List<Task> get tasks => List.unmodifiable(_tasks);
  List<bool> get isStrikedList => List.unmodifiable(_isStrikedList);
  bool get isLoading => _isLoading;

  void update(int caseId) async {
    _isLoading = true;
    notifyListeners();
    _tasks = await _tasksRepository.getTasks(caseId);
    _isLoading = false;
    final tasksLength = _tasks.length;
    _isStrikedList = List<bool>.generate(tasksLength, (i) => false);
    notifyListeners();
  }

  void toggleTextDecoration(int index) {
    _isStrikedList[index] = !_isStrikedList[index];
    notifyListeners();
  }

  void onAddButton(BuildContext context, int caseId) {
    Navigator.of(context)
        .pushNamed(MainNavigatorRoutesNames.addTask, arguments: caseId);
  }

  void onDeleteButton(int id) async {
    await _tasksRepository.deleteTask(id);
  }

  void onUpdateButton(BuildContext context, EditTaskScreenData data) {
    Navigator.of(context)
        .pushNamed(MainNavigatorRoutesNames.editTask, arguments: data);
  }

  @override
  void dispose() {
    subscriptionTasks.cancel();
    super.dispose();
  }
}
