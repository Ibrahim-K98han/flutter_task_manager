import 'package:flutter/material.dart';

class TaskListItem extends StatelessWidget {
  const TaskListItem({
    Key? key, required this.subject, required this.description, required this.date, required this.type, required this.onEditPress, required this.onDeletePress,
  }) : super(key: key);

  final String subject, description, date, type;
  final VoidCallback onEditPress, onDeletePress;


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation:0,
      margin:const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subject,style: const TextStyle(fontWeight: FontWeight.w600,color: Colors.black),),
            const SizedBox(height: 6,),
            Text(description,style: const TextStyle(fontSize: 12),),
            const SizedBox(height: 8,),
            Text('Date : $date'),
            const SizedBox(height: 6,),
            Row(
              children: [
                Chip(label: Text(type,style: const TextStyle(color: Colors.white),),backgroundColor: Colors.blue,),
                const Spacer(),
                IconButton(onPressed: onEditPress, icon:  const Icon(Icons.edit,color: Colors.green,size: 20,)),
                IconButton(onPressed: onDeletePress, icon: const Icon(Icons.delete,color: Colors.red,size: 20,))
              ],
            )
          ],
        ),
      ),
    );
  }
}