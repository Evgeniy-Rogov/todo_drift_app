import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/domain/entities/edit_task_screen_data.dart';
import 'package:todo_app/domain/entities/task_list_argument.dart';
import 'package:todo_app/ui/add_case_screen/add_case_screen.dart';
import 'package:todo_app/ui/add_case_screen/add_case_view_model.dart';
import 'package:todo_app/ui/add_task_screen/add_task_view_model.dart';
import 'package:todo_app/ui/add_task_screen/add_task_screen.dart';
import 'package:todo_app/ui/edit_case_screen/edit_case_screen.dart';
import 'package:todo_app/ui/edit_case_screen/edit_case_view_model.dart';
import 'package:todo_app/ui/edit_task_screen/edit_task_screen.dart';
import 'package:todo_app/ui/edit_task_screen/edit_task_view_model.dart';
import 'package:todo_app/ui/task_list_screen/task_list_screen.dart';
import 'package:todo_app/ui/task_list_screen/task_list_view_model.dart';
import 'package:todo_app/ui/to_do_list_screen/to_do_list_screen.dart';
import 'package:todo_app/ui/to_do_list_screen/to_do_list_view_model.dart';

class ScreenFactory {
  Widget makeToDoListSqreen(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ToDoListViewModel(),
        child: const ToDoListSqreen(),
      );

  Widget makeAddCaseScreen(BuildContext context) => ChangeNotifierProvider(
        create: (context) => AddCaseViewModel(),
        child: const AddCaseScreen(),
      );

  Widget makeTaskListScreen(BuildContext context, int caseId, String title) =>
      ChangeNotifierProvider(
        create: (context) => TaskListViewModel(caseId),
        child: TaskListScreen(
          caseId: caseId,
          title: title,
        ),
      );

  Widget makeAddTaskScreen(BuildContext context, int caseId) =>
      ChangeNotifierProvider(
        create: (context) => AddTaskViewModel(),
        child: AddTaskScreen(caseId: caseId),
      );

  Widget makeEditCaseScreen(
          BuildContext context, TaskListArguments taskListArguments) =>
      ChangeNotifierProvider(
        create: (context) => EditCaseViewModel(taskListArguments),
        child: EditCaseScreen(taskListArguments: taskListArguments),
      );

  Widget makeEditTaskScreen(BuildContext context, EditTaskScreenData data) =>
      ChangeNotifierProvider(
        create: (context) => EditTaskViewModel(data),
        child: EditTaskScreen(data: data),
      );
}
