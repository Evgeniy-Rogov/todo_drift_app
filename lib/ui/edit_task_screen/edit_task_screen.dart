import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/domain/entities/edit_task_screen_data.dart';
import 'package:todo_app/ui/edit_task_screen/edit_task_view_model.dart';

class EditTaskScreen extends StatelessWidget {
  final EditTaskScreenData data;
  const EditTaskScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final model = context.watch<EditTaskViewModel>();
    final isUpdateProcess = model.isUpdateProcess;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: TextField(
            autofocus: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              // labelText: 'Новая задача',
            ),
            controller: model.editTaskController,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: !isUpdateProcess
            ? () {
                model.updateTask();
                Navigator.of(context).pop();
              }
            : null,
        child: const Icon(Icons.check),
      ),
    );
  }
}
