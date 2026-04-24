import 'dart:developer';

import 'package:app_bottom_bar/features/task_management/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:app_bottom_bar/common_widget/asyn_value_ui.dart';
import 'package:app_bottom_bar/features/authentication/data/firebase_auth_repository/auth_repository.dart';
import 'package:app_bottom_bar/features/authentication/presentation/widgets/title_task_section/title_task_section.dart';
import 'package:app_bottom_bar/features/task_management/domain/task_model/task_model.dart';
import 'package:app_bottom_bar/features/task_management/presentation/firestore_controller/firestore_controller.dart';
import 'package:app_bottom_bar/routing/route_names/route_names.dart';

class AddTaskScreen extends ConsumerStatefulWidget {
  const AddTaskScreen({super.key});

  @override
  ConsumerState<AddTaskScreen> createState() => _State();
}

class _State extends ConsumerState<AddTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final List<String> _priorities = ['Low', 'Medium', 'High'];
  int selectedPriority = 0;

  @override
  Widget build(BuildContext context) {
    final userId = ref.watch(authStateChangesProvider).value;
    final state = ref.watch(firestoreControllerProvider);
    ref.listen(firestoreControllerProvider, (_, state) {
      state.showAlertDialogOnError(context);
    });
    return Scaffold(
      appBar: AppBar(title: Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            TitleTask(taskTitleController: titleController, text: 'Task title'),
            SizedBox(height: 15),
            TitleTask(
              taskTitleController: descriptionController,
              text: 'Task description',
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Priority',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 7),
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        final priority = _priorities[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedPriority = index;
                            });
                          },
                          child: Container(
                            width: 80,
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: selectedPriority == index
                                  ? Colors.green
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(6),
                            ),

                            // height: ,
                            child: Text(
                              priority,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: selectedPriority == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: _priorities.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () async {
                final title = titleController.text;
                final description = descriptionController.text;
                final date = DateTime.now();
                final priority = _priorities[selectedPriority];
                var myTask = TaskModel(
                  title: title,
                  description: description,
                  date: date.toString(),
                  priority: priority,
                  id: userId!.uid,
                );
                log('userId: $userId');
                log('myTask: $myTask');
                // state.isLoading?null:
                await ref
                    .read(firestoreControllerProvider.notifier)
                    .addTask(task: myTask, userId: userId.uid);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => MainScreen()),
                );
                // context.pushReplacement(RouteNames.main);
              },
              style: TextButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width, 50),
                backgroundColor: Colors.orange,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
              ),
              child: state.isLoading
                  ? CircularProgressIndicator()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: Colors.white),
                        SizedBox(width: 4),
                        Text(
                          'Add Task',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
