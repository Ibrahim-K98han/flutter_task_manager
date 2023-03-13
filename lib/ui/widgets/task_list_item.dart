import 'package:flutter/material.dart';

class TaskListItem extends StatelessWidget {
  const TaskListItem({
    Key? key,
    required this.subject,
    required this.description,
    required this.date,
    required this.type,
    required this.onEditPress,
    required this.onDeletePress,
  }) : super(key: key);

  final String subject, description, date, type;
  final VoidCallback onEditPress, onDeletePress;

  @override
  Widget build(BuildContext context) {
    String n = 'New';
    String c = 'Completed';
    String ca = 'Cancel';
    String p = 'In Progress';
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.green, width: 1)),
      elevation: 0,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subject,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.black),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              description,
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(
              height: 8,
            ),
            Text('Date : $date'),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Chip(
                    label: Text(
                      type,
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: type == n
                        ? Colors.blue
                        : type == c
                            ? Colors.green
                            : type == ca
                                ? Colors.red
                                : type == p
                                    ? Colors.pink.shade400
                                    : Colors.black),
                const Spacer(),
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.green.shade50,
                        minimumSize: const Size(15, 15)),
                    onPressed: onEditPress,
                    child: const Icon(
                      Icons.edit,
                      size: 20,
                      color: Colors.green,
                    )),
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.red.shade50,
                        minimumSize: const Size(15, 15)),
                    onPressed: onDeletePress,
                    child: const Icon(
                      Icons.delete,
                      size: 20,
                      color: Colors.red,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
