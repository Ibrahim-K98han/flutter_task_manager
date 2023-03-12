import 'package:flutter/material.dart';

import '../../data/models/task_model.dart';
import '../../data/network_utils.dart';
import '../../data/urls.dart';
import '../utils/snackbar_message.dart';
import '../widgets/screen_background_widget.dart';
import '../widgets/status_change_bottom_sheet.dart';
import '../widgets/task_list_item.dart';

class CancelTaskScreen extends StatefulWidget {
  const CancelTaskScreen({Key? key}) : super(key: key);

  @override
  State<CancelTaskScreen> createState() => _CancelTaskScreenState();
}

class _CancelTaskScreenState extends State<CancelTaskScreen> {
  TaskModel cancelTaskModel = TaskModel();
  bool inProgress = false;

  @override
  void initState() {
    super.initState();
    getAllCancelTask();
    cancelTaskModel;
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
                getAllCancelTask();
              },
              child: ListView.builder(
                itemCount: cancelTaskModel.data?.length ?? 0,
                // reverse: true,
                itemBuilder: (context, index) {
                  return TaskListItem(
                    type: 'Cancel',
                    date: cancelTaskModel.data![index].createdDate ??
                        'Unknown',
                    description:
                    cancelTaskModel.data![index].description ??
                        'Unknown',
                    subject: cancelTaskModel.data![index].title ??
                        'Unknown',
                    onDeletePress: () {},
                    onEditPress: () {
                      showChangeTaskStatus('Cancelled',
                          cancelTaskModel.data?[index].sId ?? '', () {
                            getAllCancelTask();
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
