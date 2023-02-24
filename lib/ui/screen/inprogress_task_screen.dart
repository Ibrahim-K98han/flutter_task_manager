import 'package:flutter/material.dart';

import '../widgets/screen_background_widget.dart';
import '../widgets/task_list_item.dart';

class InProgressTaskScreen extends StatefulWidget {
  const InProgressTaskScreen({Key? key}) : super(key: key);

  @override
  State<InProgressTaskScreen> createState() => _InProgressTaskScreenState();
}

class _InProgressTaskScreenState extends State<InProgressTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index){
          return TaskListItem(
            type: 'In Progress',
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
