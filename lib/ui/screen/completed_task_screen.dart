import 'package:flutter/material.dart';
import 'package:flutter_task_manager/ui/widgets/screen_background_widget.dart';

import '../widgets/task_list_item.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({Key? key}) : super(key: key);

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index){
          return TaskListItem(
            type: 'Completed',
            date: '24/02/2023',
            description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
            subject: 'First Task',
            onEditPress: (){},
            onDeletePress: (){},
          );
        },
      ),
    );
  }
}
