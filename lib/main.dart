import 'package:flutter/material.dart';
import 'package:flutter_task_manager/pages/application_page.dart';
import 'package:flutter_task_manager/ui/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: MyApp.globalKey,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      //home:ApplicationPage()
    );
  }
}
