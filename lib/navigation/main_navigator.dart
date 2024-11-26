import 'package:flutter/material.dart';
import 'package:todo_drift_app/domain/entities/edit_task_screen_data.dart';
import 'package:todo_drift_app/domain/entities/task_list_argument.dart';
import 'package:todo_drift_app/domain/factories/screen_factory.dart';

abstract class MainNavigatorRoutesNames {
  static const toDoList = '/';
  static const addCase = '/add_case';
  static const editCase = '/edit_case';
  static const taskList = '/task_list';
  static const addTask = '/task_list/add_task';
  static const editTask = '/task_list/edit_task';
}

class MainNavigator {
  final screenFactory = ScreenFactory();

  late final routes = <String, Widget Function(BuildContext)>{
    MainNavigatorRoutesNames.toDoList: screenFactory.makeToDoListSqreen,
    MainNavigatorRoutesNames.addCase: screenFactory.makeAddCaseScreen,
  };

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigatorRoutesNames.taskList:
        if (settings.arguments != null &&
            settings.arguments is TaskListArguments) {
          final arguments = settings.arguments as TaskListArguments;
          final caseId = arguments.caseId;
          final title = arguments.title;
          return MaterialPageRoute(
              builder: (context) =>
                  screenFactory.makeTaskListScreen(context, caseId, title));
        }
        return null;
      case MainNavigatorRoutesNames.addTask:
        if (settings.arguments != null && settings.arguments is int) {
          final caseId = settings.arguments as int;
          return MaterialPageRoute(
              builder: (context) =>
                  screenFactory.makeAddTaskScreen(context, caseId));
        }
        return null;
      case MainNavigatorRoutesNames.editCase:
        if (settings.arguments != null &&
            settings.arguments is TaskListArguments) {
          final taskListArguments = settings.arguments as TaskListArguments;
          return MaterialPageRoute(
              builder: (context) =>
                  screenFactory.makeEditCaseScreen(context, taskListArguments));
        }
        return null;
      case MainNavigatorRoutesNames.editTask:
        if (settings.arguments != null &&
            settings.arguments is EditTaskScreenData) {
          final data = settings.arguments as EditTaskScreenData;
          return MaterialPageRoute(
              builder: (context) =>
                  screenFactory.makeEditTaskScreen(context, data));
        }
        return null;
      default:
        return MaterialPageRoute(
            builder: (context) => const Text('Ошибка навигации'));
    }
  }
}
