import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_drift_app/domain/entities/task_list_argument.dart';
import 'package:todo_drift_app/ui/edit_case_screen/edit_case_view_model.dart';

class EditCaseScreen extends StatelessWidget {
  final TaskListArguments taskListArguments;
  const EditCaseScreen({
    super.key,
    required this.taskListArguments,
  });

  @override
  Widget build(BuildContext context) {
    final model = context.watch<EditCaseViewModel>();
    final isUpdateProcess = model.isUpdateProcess;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: TextField(
            autofocus: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              // labelText: 'Новое дело',
            ),
            controller: model.editCaseController,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: !isUpdateProcess
            ? () {
                model.updateCase();
                Navigator.of(context).pop();
              }
            : null,
        child: const Icon(Icons.check),
      ),
    );
  }
}
