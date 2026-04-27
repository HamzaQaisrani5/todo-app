// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';
// import 'package:todo_app/common_widget/asyn_value_ui.dart';
// import 'package:todo_app/common_widget/home_tasks_widget/home_tasks_widget.dart';
// import 'package:todo_app/features/authentication/data/firebase_auth_repository/auth_repository.dart';
// import 'package:todo_app/features/task_management/data/firestore_repository/firestore_repository.dart';
// import 'package:todo_app/features/task_management/domain/task_model/task_model.dart';
// import 'package:todo_app/features/task_management/presentation/widgets/task_tile/task_tile.dart';

// class AllTasksScreen extends ConsumerStatefulWidget {
//   const AllTasksScreen({super.key});

//   @override
//   ConsumerState<AllTasksScreen> createState() => _State();
// }

// class _State extends ConsumerState<AllTasksScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final userId = ref.watch(currentUserProvider)!.uid;
//     // ignore: no_leading_underscores_for_local_identifiers
//     final AsyncValue<List<TaskModel>> _tasks = ref.watch(loadTaskProvider(userId));
//     ref.listen<AsyncValue>(loadTaskProvider(userId), (_, state) {
//       return state.showAlertDialogOnError(context);
//     });
//     return Scaffold(
//       appBar: AppBar(title: Text('Home'), backgroundColor: Colors.green),
//       body: HomeTasksWidget(
//         value: _tasks,
//         data: (data) {
//           return data.isEmpty
//               ? Center(child: Text('Not tasks yet. . .'))
//               : ListView.separated(
//                   itemBuilder: (context, index) {
//                     final task = data[index];
//                     return TaskTile(task);
//                   },
//                   separatorBuilder: (context, index) {
//                     return Divider(
//                       height: 1,
//                       color: Colors.orange,
//                       thickness: 0.5,
//                     );
//                   },
//                   itemCount: data.length,
//                 );
//         },
//       ),
//     );
//   }
// }

import 'package:app_bottom_bar/annotation_way_of_project/features/task_management/presentation/firestore_controller/firestore_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_bottom_bar/annotation_way_of_project/common_widget/asyn_value_ui.dart';
import 'package:app_bottom_bar/annotation_way_of_project/common_widget/home_tasks_widget/home_tasks_widget.dart';
import 'package:app_bottom_bar/annotation_way_of_project/features/authentication/data/firebase_auth_repository/auth_repository.dart';
import 'package:app_bottom_bar/annotation_way_of_project/features/task_management/data/firestore_repository/firestore_repository.dart';
import 'package:app_bottom_bar/annotation_way_of_project/features/task_management/domain/task_model/task_model.dart';
import 'package:app_bottom_bar/annotation_way_of_project/features/task_management/presentation/widgets/task_tile/task_tile.dart';

class AllTasksScreen extends ConsumerWidget {
  const AllTasksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangesProvider);
    // final _allTasks = ref.watch(loadTaskProvider(authState!.uid));
    // ref.listen(firestoreControllerProvider, (_, state) {
    //   state.showAlertDialogOnError(context);
    // });

    return Scaffold(
      appBar: AppBar(title: const Text('Home'), backgroundColor: Colors.green),

      body:
          authState.when(
            data: (user) {
              // 🔴 agar user null ho
              if (user == null) {
                return const Center(child: Text('User not logged in'));
              }
              // ✅ user mil gaya to tasks load karo
              final AsyncValue<List<TaskModel>> tasks = ref.watch(
                loadTaskProvider(user.uid),
              );
              // error listener
              ref.listen<AsyncValue<List<TaskModel>>>(loadTaskProvider(user.uid), (
                _,
                state,
              ) {
                state.showAlertDialogOnError(context);
              });
              return HomeTasksWidget(
                value: tasks,
                data: (data) {
                  if (data.isEmpty) {
                    return const Center(child: Text('No tasks yet...'));
                  }
                  return ListView.separated(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final task = data[index];
                      return TaskTile(task);
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 1,
                        color: Colors.orange,
                        thickness: 0.5,
                      );
                    },
                  );
                },
              );
            },
            // 🔄 loading state (auth change ke time)
            loading: () => const Center(child: CircularProgressIndicator()),
            // ❌ error state
            error: (error, stackTrace) => Center(child: Text('Error: $error')),
      
      
          // HomeTasksWidget(
          //   value: _allTasks,
          //   data: (data) {
          //     return data.isEmpty
          //         ? Center(child: Text('No Incomplete Tasks yet . . .'))
          //         : ListView.separated(
          //             itemBuilder: (_, index) {
          //               final task = data[index];
          //               return TaskTile(task);
          //             },
          //             separatorBuilder: (_, index) {
          //               return Padding(
          //                 padding: EdgeInsetsGeometry.all(5),
          //                 child: Divider(
          //                   height: 1,
          //                   color: Colors.orange,
          //                   thickness: 0.5,
          //                 ),
          //               );
          //             },
          //             itemCount: data.length,
          //           );
          //   },
          // ), 
          ),
    );
  }
}
