
import 'package:flutter/material.dart';
import 'package:flutter_task_manager/data/models/task_model.dart';
import 'package:flutter_task_manager/data/network_utils.dart';
import 'package:flutter_task_manager/data/urls.dart';
import 'package:flutter_task_manager/ui/utils/snackbar_message.dart';
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
  bool inProgress = false;

  @override
  void initState() {
    super.initState();
    getAllNewTask();
  }

  Future<void> getAllNewTask() async {
    inProgress = true;
    setState(() {

    });
    final response = await NetworkUtils().getMethod(Urls.newTaskUrl,);
    if (response != null) {
      newTaskModel = TaskModel.fromJson(response);
    } else {
      showSnackBarMessage(context, 'Unable to fetch new task! try again',true);
    }
    inProgress = false;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: Column(
        children: [
          Row(
            children:  [
              Expanded(
                  child: DashboardItem(
                typeOfTask: 'New',
                numberOfTasks: newTaskModel.data!.length ?? 0,
              )),
              Expanded(
                  child: DashboardItem(
                typeOfTask: 'Completed',
                numberOfTasks: 23,
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
            child: inProgress ? const Center(
              child: CircularProgressIndicator(),
            ) : RefreshIndicator(
              onRefresh: ()async{
                getAllNewTask();
              },
              child: ListView.builder(
                itemCount: newTaskModel.data!.length ?? 0,
                // reverse: true,
                itemBuilder: (context, index) {
                  return TaskListItem(
                    type: 'New',
                    date: newTaskModel.data![index].createdDate ?? 'Unknown',
                    description: newTaskModel.data![index].description ?? 'Unknown',
                    subject: newTaskModel.data![index].title ?? 'Unknown',
                    onEditPress: () {},
                    onDeletePress: () {},
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
