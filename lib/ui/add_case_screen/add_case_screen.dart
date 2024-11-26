import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/ui/add_case_screen/add_case_view_model.dart';

class AddCaseScreen extends StatelessWidget {
  const AddCaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AddCaseViewModel>();
    final isAddProcess = model.isAddProcess;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: TextField(
            autofocus: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Новое дело',
            ),
            controller: model.caseController,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: !isAddProcess
            ? () {
                model.addCase();
                Navigator.of(context).pop();
              }
            : null,
        child: const Icon(Icons.check),
      ),
    );
  }
}
