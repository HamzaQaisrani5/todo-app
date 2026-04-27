import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_bottom_bar/annotation_way_of_project/common_widget/asyn_value_ui.dart';
import 'package:app_bottom_bar/annotation_way_of_project/common_widget/home_tasks_widget/home_tasks_widget.dart';
import 'package:app_bottom_bar/annotation_way_of_project/features/authentication/data/firebase_auth_repository/auth_repository.dart';
import 'package:app_bottom_bar/annotation_way_of_project/features/task_management/data/firestore_repository/firestore_repository.dart';
import 'package:app_bottom_bar/annotation_way_of_project/features/task_management/presentation/firestore_controller/firestore_controller.dart';
import 'package:app_bottom_bar/annotation_way_of_project/features/task_management/presentation/widgets/task_tile/task_tile.dart';

class CompletedTaskScreen extends ConsumerStatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  ConsumerState<CompletedTaskScreen> createState() => _State();
}

class _State extends ConsumerState<CompletedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateChangesProvider).value;
    final _inCompleteTasks = ref.watch(loadComplateTaskProvider(authState!.uid));
    ref.listen(firestoreControllerProvider, (_, state) {
      return state.showAlertDialogOnError(context);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Complete Tasks'),
        backgroundColor: Colors.green,
      ),
      body:
      // authState.when(
      //   data: (data) {
      //     if (data == null) {
      //       return Center(child: Text('Not logged In'));
      //     }
      //     final completeTasks = ref.watch(loadComplateTaskProvider(data.uid));
      //     ref.listen(firestoreControllerProvider, (_, state) {
      //       state.showAlertDialogOnError(context);
      //     });
      //     return HomeTasksWidget(
      //       value: completeTasks,
      //       data: (data) {
      //         if (data.isEmpty) {
      //           return Center(child: Text('Not tasks yet'));
      //         }
      //         return ListView.separated(
      //           itemCount: data.length,
      //           itemBuilder: (context, index) {
      //             final task = data[index];
      //             return TaskTile(task);
      //           },
      //           separatorBuilder: (context, index) {
      //             return const Divider(
      //               height: 1,
      //               color: Colors.orange,
      //               thickness: 0.5,
      //             );
      //           },
      //         );
      //       },
      //     );
      //   },
      //   error: (error, stackTrace) {
      //     return Center(child: Text(error.toString()));
      //   },
      //   loading: () {
      //     return CircularProgressIndicator();
      //   },
      // ),

      HomeTasksWidget(
        value: _inCompleteTasks,
        data: (data) {
          return data.isEmpty
              ? Center(child: Text('No Incomplete Tasks yet . . .'))
              : ListView.separated(
                  itemBuilder: (_, index) {
                    final task = data[index];
                    return TaskTile(task);
                  },
                  separatorBuilder: (_, index) {
                    return Padding(
                      padding: EdgeInsetsGeometry.all(5),
                      child: Divider(
                        height: 1,
                        color: Colors.orange,
                        thickness: 0.5,
                      ),
                    );
                  },
                  itemCount: data.length,
                );
        },
      ),
    );
  }
}
