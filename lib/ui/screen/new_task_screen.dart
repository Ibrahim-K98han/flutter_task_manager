import 'package:flutter/material.dart';
import 'package:flutter_task_manager/data/models/task_model.dart';
import 'package:flutter_task_manager/data/network_utils.dart';
import 'package:flutter_task_manager/data/urls.dart';
import 'package:flutter_task_manager/ui/utils/snackbar_message.dart';
import 'package:flutter_task_manager/ui/widgets/app_elevated_button.dart';
import 'package:flutter_task_manager/ui/widgets/screen_background_widget.dart';

import '../widgets/dashboard_item.dart';
import '../widgets/task_list_item.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  TaskModel newTaskModel = TaskModel();
  TaskModel completedTaskModel = TaskModel();
  bool inProgress = false;

  @override
  void initState() {
    super.initState();
    getAllNewTask();
  }

  Future<void> getAllNewTask() async {
    inProgress = true;
    setState(() {});
    final response = await NetworkUtils().getMethod(
      Urls.newTaskUrl,
    );
    if (response != null) {
      newTaskModel = TaskModel.fromJson(response);
    } else {
      showSnackBarMessage(context, 'Unable to fetch new task! try again', true);
    }
    inProgress = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: DashboardItem(
                typeOfTask: 'New',
                numberOfTasks: newTaskModel.data?.length ?? 0,
              )),
              Expanded(
                  child: DashboardItem(
                typeOfTask: 'Completed',
                numberOfTasks: completedTaskModel.data?.length ?? 0,
              )),
              Expanded(
                  child: DashboardItem(
                typeOfTask: 'Cancelled',
                numberOfTasks: 23,
              )),
              Expanded(
                  child: DashboardItem(
                typeOfTask: 'In Progress',
                numberOfTasks: 23,
              )),
            ],
          ),
          Expanded(
            child: inProgress
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: () async {
                      getAllNewTask();
                    },
                    child: ListView.builder(
                      itemCount: newTaskModel.data!.length ?? 0,
                      // reverse: true,
                      itemBuilder: (context, index) {
                        return TaskListItem(
                          type: 'New',
                          date: newTaskModel.data![index].createdDate ??
                              'Unknown',
                          description: newTaskModel.data![index].description ??
                              'Unknown',
                          subject: newTaskModel.data![index].title ?? 'Unknown',
                          onDeletePress: () {},
                          onEditPress: () {
                            showChangeTaskStatus();
                          },
                        );
                      },
                    ),
                  ),
          )
        ],
      ),
    );
  }

  showChangeTaskStatus() {
    String groupTask = 'New';
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, changeState) {
            return Column(
              children: [
                RadioListTile(
                    value: 'New',
                    groupValue: groupTask,
                    title: const Text('New'),
                    onChanged: (state) {
                      groupTask = state!;
                      changeState(() {});
                    }),
                RadioListTile(
                    value: 'Completed',
                    groupValue: groupTask,
                    title: const Text('Completed'),
                    onChanged: (state) {
                      groupTask = state!;
                      changeState(() {});
                    }),
                RadioListTile(
                    value: 'Cancelled',
                    groupValue: groupTask,
                    title: const Text('Cancelled'),
                    onChanged: (state) {
                      groupTask = state!;
                      changeState(() {});
                    }),
                RadioListTile(
                    value: 'Progress',
                    groupValue: groupTask,
                    title: const Text('Progress'),
                    onChanged: (state) {
                      groupTask = state!;
                      changeState(() {});
                    }),
                AppElevatedButton(
                    child: const Text('Change Status'), onTap: () {})
              ],
            );
          });
        });
  }
}
