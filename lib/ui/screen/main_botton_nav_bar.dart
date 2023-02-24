import 'package:flutter/material.dart';
import 'package:flutter_task_manager/ui/screen/cancel_task_screen.dart';
import 'package:flutter_task_manager/ui/screen/completed_task_screen.dart';
import 'package:flutter_task_manager/ui/screen/inprogress_task_screen.dart';
import 'package:flutter_task_manager/ui/screen/new_task_screen.dart';
import 'package:flutter_task_manager/ui/widgets/screen_background_widget.dart';

class MainBottomNavbar extends StatefulWidget {
  const MainBottomNavbar({Key? key}) : super(key: key);

  @override
  State<MainBottomNavbar> createState() => _MainBottomNavbarState();
}

class _MainBottomNavbarState extends State<MainBottomNavbar> {
  int _seletedScreen = 0;
  final List<Widget> _screens = const[
     NewTaskScreen(),
     CompletedTaskScreen(),
     CancelTaskScreen(),
     InProgressTaskScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: _screens[_seletedScreen],
        ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black38,
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        onTap: (index){
          _seletedScreen = index;
          setState(() {

          });

        },
        elevation: 4,
        currentIndex: _seletedScreen ,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.new_label_outlined), label: 'New'),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Completed'),
          BottomNavigationBarItem(icon: Icon(Icons.close), label: 'Cancelled'),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'Progress'),
        ],
      ),
    );
  }
}
