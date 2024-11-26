import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_drift_app/domain/entities/task_list_argument.dart';
import 'package:todo_drift_app/ui/to_do_list_screen/to_do_list_view_model.dart';

class ToDoListSqreen extends StatelessWidget {
  const ToDoListSqreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ToDoListViewModel>();
    return Scaffold(
      appBar: AppBar(title: const Text('Дела')),
      body: model.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: ListView.separated(
                itemCount: model.cases.length,
                itemBuilder: (context, i) => OneCaseTile(index: i),
                separatorBuilder: (context, i) => const Divider(),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => model.onAddButton(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class OneCaseTile extends StatelessWidget {
  final int index;
  const OneCaseTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final model = context.read<ToDoListViewModel>();
    final oneCase = model.cases[index];
    final taskListArguments = TaskListArguments(oneCase.id, oneCase.title);

    return Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.4,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) =>
                model.onUpdateButton(context, taskListArguments),
            backgroundColor: const Color.fromARGB(255, 99, 97, 221),
            foregroundColor: Colors.white,
            icon: Icons.edit_square,
            label: 'Редактировать',
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
          ),
        ],
      ),
      endActionPane: ActionPane(
        extentRatio: 0.4,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => model.onDeleteButton(oneCase.id),
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Удалить',
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(5),
            ),
          ),
        ],
      ),
      child: ListTile(
        title: Text(oneCase.title),
        onTap: () => model.onTapOneCaseTile(context, taskListArguments),
      ),
    );
  }
}
