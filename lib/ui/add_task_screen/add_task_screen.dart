import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_drift_app/ui/add_task_screen/add_task_view_model.dart';

class AddTaskScreen extends StatelessWidget {
  final int caseId;
  const AddTaskScreen({super.key, required this.caseId});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AddTaskViewModel>();
    final isAddProcess = model.isAddProcess;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          child: TextField(
            expands: true,
            maxLines: null,
            autofocus: true,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Новая задача',
              hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w100),
            ),
            controller: model.taskController,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: !isAddProcess
            ? () {
                model.addTask(caseId);
                Navigator.of(context).pop();
              }
            : null,
        child: const Icon(Icons.check),
      ),
    );
  }
}
