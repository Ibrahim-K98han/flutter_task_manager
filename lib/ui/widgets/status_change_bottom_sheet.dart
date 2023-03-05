
import 'package:flutter/material.dart';
import 'package:flutter_task_manager/main.dart';

import '../../data/network_utils.dart';
import '../../data/urls.dart';
import '../utils/snackbar_message.dart';
import 'app_elevated_button.dart';

showChangeTaskStatus(String taskId, VoidCallback onTaskChangeCompleted) {
  String groupTask = 'New';
  showModalBottomSheet(
      context: MyApp.globalKey.currentContext!,
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
              Padding(
                padding: const EdgeInsets.all(16),
                child: AppElevatedButton(
                    child: const Text('Change Status'),
                    onTap: () async {
                      final response = await NetworkUtils().getMethod(
                          Urls.changeTaskStatus(taskId, groupTask));
                      if (response != null) {
                        onTaskChangeCompleted();
                        Navigator.pop(context);
                      } else {
                        showSnackBarMessage(
                            context, 'Status change failed! try again', true);
                      }
                    }),
              )
            ],
          );
        });
      });
}