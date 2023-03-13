import 'package:flutter/material.dart';
import 'package:flutter_task_manager/task_manager2/ui/screen/splash_screen_2.dart';
import 'package:flutter_task_manager/ui/screen/splash_screen.dart';

void main() {
  runApp(const TaskManagerApp());
}

class TaskManagerApp extends StatefulWidget {
  const TaskManagerApp({super.key});

  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  @override
  State<TaskManagerApp> createState() => _TaskManagerAppState();
}

class _TaskManagerAppState extends State<TaskManagerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: TaskManagerApp.globalKey,
      debugShowCheckedModeBanner: false,
      //home: const SplashScreen(),
      //home:ApplicationPage()
      home: const SplashScreen2(),
    );
  }
}
