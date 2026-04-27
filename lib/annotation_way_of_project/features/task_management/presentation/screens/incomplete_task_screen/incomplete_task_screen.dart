import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_bottom_bar/annotation_way_of_project/common_widget/asyn_value_ui.dart';
import 'package:app_bottom_bar/annotation_way_of_project/common_widget/home_tasks_widget/home_tasks_widget.dart';
import 'package:app_bottom_bar/annotation_way_of_project/features/authentication/data/firebase_auth_repository/auth_repository.dart';
import 'package:app_bottom_bar/annotation_way_of_project/features/task_management/data/firestore_repository/firestore_repository.dart';
import 'package:app_bottom_bar/annotation_way_of_project/features/task_management/presentation/firestore_controller/firestore_controller.dart';
import 'package:app_bottom_bar/annotation_way_of_project/features/task_management/presentation/widgets/task_tile/task_tile.dart';

class IncompleteTaskScreen extends ConsumerStatefulWidget {
  const IncompleteTaskScreen({super.key});

  @override
  ConsumerState<IncompleteTaskScreen> createState() => _State();
}

class _State extends ConsumerState<IncompleteTaskScreen> {
  @override
  Widget build(BuildContext context) {
    final userId = ref.watch(authStateChangesProvider).value;
    final _incompleteTasks = ref.watch(loadInComplateTaskProvider(userId!.uid));

    ref.listen(firestoreControllerProvider, (_, state) {
      return state.showAlertDialogOnError(context);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Incomplete Tasks'),
        backgroundColor: Colors.green,
      ),
      body: HomeTasksWidget(
        value: _incompleteTasks,
        data: (data) {
         return data.isEmpty
              ? Center(child: Text('Not Incomplete Tasks yet. . . '))
              : ListView.separated(
                  itemBuilder: (ctx, index) {
                    final tasks = data[index];
                    return TaskTile(tasks);
                  },
                  separatorBuilder: (_, index) =>
                      Divider(height: 1, color: Colors.orange, thickness: 0.5),
                  itemCount: data.length,
                );
        },
      ),
    );
  }
}
