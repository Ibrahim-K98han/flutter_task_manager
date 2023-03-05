import 'package:flutter/material.dart';
import 'package:flutter_task_manager/ui/widgets/screen_background_widget.dart';

import '../../data/models/task_model.dart';
import '../../data/network_utils.dart';
import '../../data/urls.dart';
import '../utils/snackbar_message.dart';
import '../widgets/dashboard_item.dart';
import '../widgets/task_list_item.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({Key? key}) : super(key: key);

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  TaskModel completedTaskModel = TaskModel();
  TaskModel newTaskModel = TaskModel();
  bool inProgress = false;

  @override
  void initState() {
    super.initState();
    getAllCompletedTask();
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
      showSnackBarMessage(context, 'Unable to fetch completed task! try again', true);
    }
    inProgress = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: Column(
        children: [

          Expanded(
            child: inProgress
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : RefreshIndicator(
              onRefresh: () async {
                getAllCompletedTask();
              },
              child: ListView.builder(
                itemCount: completedTaskModel.data?.length ?? 0,
                // reverse: true,
                itemBuilder: (context, index) {
                  return TaskListItem(
                    type: 'Completed',
                    date: completedTaskModel.data![index].createdDate ??
                        'Unknown',
                    description: completedTaskModel.data![index].description ??
                        'Unknown',
                    subject: completedTaskModel.data![index].title ?? 'Unknown',
                    onDeletePress: () {},
                    onEditPress: () {
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
