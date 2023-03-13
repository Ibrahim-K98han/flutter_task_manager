import 'package:flutter/material.dart';
import 'package:flutter_task_manager/data/models/task_model.dart';
import 'package:flutter_task_manager/data/network_utils.dart';
import 'package:flutter_task_manager/data/urls.dart';
import 'package:flutter_task_manager/ui/utils/snackbar_message.dart';
import 'package:flutter_task_manager/ui/widgets/app_elevated_button.dart';
import 'package:flutter_task_manager/ui/widgets/screen_background_widget.dart';

import '../widgets/dashboard_item.dart';
import '../widgets/status_change_bottom_sheet.dart';
import '../widgets/task_list_item.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  TaskModel newTaskModel = TaskModel();
  TaskModel completedTaskModel = TaskModel();
  TaskModel cancelTaskModel = TaskModel();
  TaskModel progressTaskModel = TaskModel();
  bool inProgress = false;

  @override
  void initState() {
    super.initState();
    getAllNewTask();
    getAllProgressTask();
    getAllCancelTask();
    getAllCompletedTask();
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
      if (mounted) {
        showSnackBarMessage(
            context, 'Unable to fetch new task! try again', true);
      }
    }
    inProgress = false;
    setState(() {});
  }

  Future<void> getAllProgressTask() async {
    inProgress = true;
    setState(() {});
    final response = await NetworkUtils().getMethod(
      Urls.progressTaskUrl,
    );
    if (response != null) {
      progressTaskModel = TaskModel.fromJson(response);
    } else {
      if (mounted) {
        showSnackBarMessage(
            context, 'Unable to fetch completed task! try again', true);
      }
    }
    inProgress = false;
    setState(() {});
  }

  Future<void> getAllCancelTask() async {
    inProgress = true;
    setState(() {});
    final response = await NetworkUtils().getMethod(
      Urls.cancelTaskUrl,
    );
    if (response != null) {
      cancelTaskModel = TaskModel.fromJson(response);
    } else {
      if (mounted) {
        showSnackBarMessage(
            context, 'Unable to fetch completed task! try again', true);
      }
    }
    inProgress = false;
    setState(() {});
  }

  Future<void> getAllCompletedTask() async {
    inProgress = true;
    setState(() {});
    final response = await NetworkUtils().getMethod(
      Urls.completedTaskUrl,
    );
    if (response != null) {
      completedTaskModel = TaskModel.fromJson(response);
    } else {
      if (mounted) {
        showSnackBarMessage(
            context, 'Unable to fetch completed task! try again', true);
      }
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
                ),
              ),
              Expanded(
                  child: DashboardItem(
                typeOfTask: 'Cancelled',
                numberOfTasks: cancelTaskModel.data?.length ?? 0,
              )),
              Expanded(
                  child: DashboardItem(
                typeOfTask: 'In Progress',
                numberOfTasks: progressTaskModel.data?.length ?? 0,
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
                          onDeletePress: () {

                          },
                          onEditPress: () {
                            showChangeTaskStatus(
                                'New', newTaskModel.data?[index].sId ?? '', () {
                              getAllNewTask();
                            });
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
}
