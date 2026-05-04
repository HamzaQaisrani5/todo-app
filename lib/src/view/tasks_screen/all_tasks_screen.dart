import 'package:app_bottom_bar/annotation_way_of_project/features/task_management/domain/task_model/task_model.dart';
import 'package:app_bottom_bar/src/providers/auth_provider/logout_provider.dart';
import 'package:app_bottom_bar/src/providers/task_provider/load_tasks_provider.dart';
import 'package:app_bottom_bar/src/routing/state_route_name.dart';
import 'package:app_bottom_bar/src/states/auth_states/login_state.dart';
import 'package:app_bottom_bar/src/states/tasks_state/load_tasks_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../annotation_way_of_project/features/task_management/presentation/widgets/task_tile/task_tile.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _State();
}

class _State extends ConsumerState<HomeScreen> {
  int userid = 6;
  @override
  Widget build(BuildContext context) {
    final userid = FirebaseAuth.instance.currentUser!.uid;
    final state = ref.watch(loadTasksProvider);
    // final auth = ref.watch(logOutProvider);
    if (state is LoadTasksInitial) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(loadTasksProvider.notifier).loadTasks(userId: userid);
      });
    }
    ref.listen(logOutProvider, (_, next) {
      if (next is LoginSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.successMessage),
            backgroundColor: Colors.green,
          ),
        );
        context.go(StateRouteNames.signupScreen); 
      } else if (next is LoginError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.errorMessage),
            backgroundColor: Colors.red,  
          ),
        );
      }
    });
    Widget body;
    if (state is LoadTasksLoading) {
      body = loadtasksLoading();
    } else if (state is LoadTasksError) {
      body = loadTasksError(errorMessage: state.errorMessage, userid: userid);
    } else if (state is LoadTasksSuccess) {
      body = loadTasksSuccess(tasks: state.allTasks);
    } else {
      body = someThingWrong();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () async {
              await ref.read(logOutProvider.notifier).logOut(userId: userid);
            },
            icon: Icon(Icons.logout_outlined, color: Colors.white),
          ),
        ],
      ),
      body: SafeArea(child: body),
    );
  }

  Widget loadtasksLoading() {
    return Center(child: CircularProgressIndicator(color: Colors.green));
  }

  Widget loadTasksError({
    required String errorMessage,
    required String userid,
  }) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            SizedBox(height: 2),
            Text(
              'Failed to load medications',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.red[700],
              ),
            ),
            SizedBox(height: 3),
            Text(
              errorMessage,
              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 3),
            TextButton(
              onPressed: () {
                ref.read(loadTasksProvider.notifier).loadTasks(userId: userid);
              },
              style: TextButton.styleFrom(backgroundColor: Colors.redAccent),
              child: Text("Refresh", style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  Widget loadTasksSuccess({required List<TaskModel> tasks}) {
    return ListView.separated(
      physics: AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.all(8.0),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskTile(task);
      },
      separatorBuilder: (context, index) {
        return const Divider(height: 1, color: Colors.orange, thickness: 0.5);
      },
    );
  }

  Widget someThingWrong() {
    return Center(child: Text('Unknown error occured'));
  }
}
