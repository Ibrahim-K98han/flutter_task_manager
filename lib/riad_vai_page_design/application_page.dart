import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../ui/screen/main_botton_nav_bar.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            'আমিন মিয়ার বিস্তারিত',
            style: TextStyle(fontSize: 15),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none,
                size: 18,
              )),
          const Padding(
            padding: EdgeInsets.only(right: 5),
            child: CircleAvatar(
              radius: 18, // Image radius
              backgroundImage: AssetImage('images/person.jpg'),
            ),
          ),
        ],
      ),
       body: MainBottomNavbar(),
    );
  }
}
