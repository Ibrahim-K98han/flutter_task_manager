import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/screen_background_widget2.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground2(
        widget:  Center(
            child: SvgPicture.asset(
              'assets/images/logo.svg',
              width: 150,
              fit: BoxFit.scaleDown,
            )
        ),
      )
    );
  }
}


