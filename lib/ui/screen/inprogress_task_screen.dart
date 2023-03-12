import 'package:flutter/material.dart';

import '../../data/models/task_model.dart';
import '../../data/network_utils.dart';
import '../../data/urls.dart';
import '../utils/snackbar_message.dart';
import '../widgets/screen_background_widget.dart';
import '../widgets/status_change_bottom_sheet.dart';
import '../widgets/task_list_item.dart';

class InProgressTaskScreen extends StatefulWidget {
  const InProgressTaskScreen({Key? key}) : super(key: key);

  @override
  State<InProgressTaskScreen> createState() => _InProgressTaskScreenState();
}

class _InProgressTaskScreenState extends State<InProgressTaskScreen> {
  TaskModel progressTaskModel = TaskModel();
  bool inProgress = false;


  @override
  void initState() {
    super.initState();
    getAllProgressTask();
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

  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child:  Column(
        children: [
          Expanded(
            child: inProgress
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : RefreshIndicator(
              onRefresh: () async {
                getAllProgressTask();
              },
              child: ListView.builder(
                itemCount: progressTaskModel.data?.length ?? 0,
                // reverse: true,
                itemBuilder: (context, index) {
                  return TaskListItem(
                    type: 'In Progress',
                    date: progressTaskModel.data![index].createdDate ??
                        'Unknown',
                    description:
                    progressTaskModel.data![index].description ??
                        'Unknown',
                    subject: progressTaskModel.data![index].title ??
                        'Unknown',
                    onDeletePress: () {},
                    onEditPress: () {
                      showChangeTaskStatus('Progress',
                          progressTaskModel.data?[index].sId ?? '', () {
                            getAllProgressTask();
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
