import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task_manager/data/auth_util.dart';
import 'package:flutter_task_manager/ui/screen/login.dart';
import 'package:flutter_task_manager/ui/screen/main_botton_nav_bar.dart';

import '../widgets/screen_background_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value){
      checkUserAuthState();
    });

  }

  void checkUserAuthState() async {
    final bool result = await AuthUtils.checkLoginState();
    if (result) {
      await AuthUtils.getAuthData();
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => MainBottomNavbar()), (
              route) => false);
    }else{
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => LoginScreen()), (
              route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenBackground(
          child: Center(
              child: SvgPicture.asset(
                'images/logo.svg',
                width: 160,
                fit: BoxFit.scaleDown,
              )),
        ));
  }
}
