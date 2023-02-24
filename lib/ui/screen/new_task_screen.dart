import 'package:flutter/material.dart';
import 'package:flutter_task_manager/ui/widgets/screen_background_widget.dart';

import '../widgets/dashboard_item.dart';
import '../widgets/task_list_item.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: Column(
        children: [
          Row(
            children:  const[
              Expanded(
                  child: DashboardItem(
                typeOfTask: 'New',
                numberOfTasks: 23,
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
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index){
                return TaskListItem(
                  type: 'New',
                  date: '24/02/2023',
                  description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
                  subject: 'First Task',
                  onEditPress: (){},
                  onDeletePress: (){},
                );
              },
            ),
          )
        ],
      ),
    );
  }
}



