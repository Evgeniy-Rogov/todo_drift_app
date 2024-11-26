import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/domain/entities/edit_task_screen_data.dart';
import 'package:todo_app/ui/task_list_screen/task_list_view_model.dart';

class TaskListScreen extends StatelessWidget {
  final int caseId;
  final String title;
  const TaskListScreen({
    super.key,
    required this.caseId,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final model = context.watch<TaskListViewModel>();
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: model.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: ListView.separated(
                itemCount: model.tasks.length,
                itemBuilder: (context, i) => OneTaskWidget(index: i),
                separatorBuilder: (context, i) => const Divider(),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => model.onAddButton(context, caseId),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class OneTaskWidget extends StatelessWidget {
  final int index;
  const OneTaskWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final model = context.read<TaskListViewModel>();
    final isStrikedList = model.isStrikedList;
    final textStyle = isStrikedList[index] == false
        ? const TextStyle(decoration: TextDecoration.none)
        : const TextStyle(decoration: TextDecoration.lineThrough);
    final oneTask = model.tasks[index];
    final data = EditTaskScreenData(oneTask.id, oneTask.body);

    return Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.4,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => model.onUpdateButton(context, data),
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
            onPressed: (context) => model.onDeleteButton(oneTask.id),
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
        title: Text(
          oneTask.body,
          style: textStyle,
        ),
        onTap: () => model.toggleTextDecoration(index),
      ),
    );
  }
}
