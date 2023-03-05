
import 'package:flutter/material.dart';
import 'package:flutter_task_manager/main.dart';

import '../../data/network_utils.dart';
import '../../data/urls.dart';
import '../utils/snackbar_message.dart';
import 'app_elevated_button.dart';

showChangeTaskStatus(String currentStatus ,String taskId, VoidCallback onTaskChangeCompleted) {
  String statusValue = currentStatus;
  showModalBottomSheet(
      context: MyApp.globalKey.currentContext!,
      builder: (context) {
        return StatefulBuilder(builder: (context, changeState) {
          return Column(
            children: [
              RadioListTile(
                  value: 'New',
                  groupValue: statusValue,
                  title: const Text('New'),
                  onChanged: (state) {
                    statusValue = state!;
                    changeState(() {});
                  }),
              RadioListTile(
                  value: 'Completed',
                  groupValue: statusValue,
                  title: const Text('Completed'),
                  onChanged: (state) {
                    statusValue = state!;
                    changeState(() {});
                  }),
              RadioListTile(
                  value: 'Cancelled',
                  groupValue: statusValue,
                  title: const Text('Cancelled'),
                  onChanged: (state) {
                    statusValue = state!;
                    changeState(() {});
                  }),
              RadioListTile(
                  value: 'Progress',
                  groupValue: statusValue,
                  title: const Text('Progress'),
                  onChanged: (state) {
                    statusValue = state!;
                    changeState(() {});
                  }),
              Padding(
                padding: const EdgeInsets.all(16),
                child: AppElevatedButton(
                    child: const Text('Change Status'),
                    onTap: () async {
                      final response = await NetworkUtils().getMethod(
                          Urls.changeTaskStatus(taskId, statusValue));
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