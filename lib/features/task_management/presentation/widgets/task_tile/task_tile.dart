import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:app_bottom_bar/features/authentication/data/firebase_auth_repository/auth_repository.dart';
import 'package:app_bottom_bar/features/authentication/presentation/widgets/common_text_field/common_text_field.dart';
import 'package:app_bottom_bar/features/task_management/data/firestore_repository/firestore_repository.dart';
import 'package:app_bottom_bar/features/task_management/domain/task_model/task_model.dart';
import 'package:app_bottom_bar/features/task_management/presentation/firestore_controller/firestore_controller.dart';

String formattedDate(String date) {
  final parse = DateTime.parse(date);
  final formatted = DateFormat('dd-MM-yyyy').format(parse);
  return formatted;
}

class TaskTile extends ConsumerStatefulWidget {
  final TaskModel task;
  const TaskTile(this.task, {super.key});

  @override
  ConsumerState<TaskTile> createState() => _State();
}

class _State extends ConsumerState<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),

      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.task.title,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  widget.task.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Text(widget.task.priority),
                    ),
                    SizedBox(width: 5),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: EdgeInsets.all(2),
                      // margin: EdgeInsets.all(5),
                      child: Text(formattedDate(widget.task.date)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Checkbox(
                  value: widget.task.isComplete,
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    } else {
                      final userId = ref.watch(authStateChangesProvider).value;
                      ref
                          .read(firestoreRepositoryProvider)
                          .updateTaskCompletion(
                            userId: userId!.uid,
                            taskId: widget.task.id!,
                            isComplete: value,
                          );
                    }
                  },
                ),
                SizedBox(height: 3),
                IconButton(
                  onPressed: () {
                    edit();
                  },
                  icon: Icon(Icons.edit),
                ),
                SizedBox(height: 3),
                IconButton(
                  onPressed: () async {
                    final userId = ref.watch(authStateChangesProvider).value;

                    await ref
                        .read(firestoreControllerProvider.notifier)
                        .deleteTask(
                          task: widget.task,
                          userId: userId!.uid,
                          taskId: widget.task.id!,
                        );
                  },
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> edit() async {
    TextEditingController title = TextEditingController(
      text: widget.task.title,
    );
    TextEditingController description = TextEditingController(
      text: widget.task.description,
    );
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Icon(Icons.edit),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonTextField(
                  keyboardType: TextInputType.text,
                  hintText: 'Title',
                  hintStyle: TextStyle(fontSize: 12),
                  controller: title,
                ),
                SizedBox(height: 10),
                CommonTextField(
                  keyboardType: TextInputType.text,
                  hintText: 'Description',
                  hintStyle: TextStyle(fontSize: 12),
                  controller: description,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.green,
                backgroundColor: Colors.transparent,
              ),
              onPressed: () {
                context.pop();
              },
              child: Text('Cancel'),
            ),
            SizedBox(width: 6),
            TextButton(
              style: TextButton.styleFrom(
                // foregroundColor: Colors.green,
                backgroundColor: Colors.transparent,
              ),
              onPressed: () async {
                widget.task.title = title.text;
                widget.task.description = description.text;
                final userId = ref.watch(authStateChangesProvider).value;
                await ref
                    .read(firestoreControllerProvider.notifier)
                    .updateTask(
                      task: widget.task,
                      userId: userId!.uid,
                      taskId: widget.task.id.toString(),
                    );
                // ignore: use_build_context_synchronously
                context.pop();
              },
              child: Text('Edit'),
            ),
          ],
        );
      },
    );
  }
}
