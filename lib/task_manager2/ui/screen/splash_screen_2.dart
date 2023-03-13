import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/background.svg',
            width: screenSize.width,
            height: screenSize.height,
            fit: BoxFit.cover,
          ),
          Center(
              child: SvgPicture.asset(
                  'assets/images/logo.svg',
                width: 150,
                fit: BoxFit.scaleDown,
              )
          )
        ],
      ),
    );
  }
}
