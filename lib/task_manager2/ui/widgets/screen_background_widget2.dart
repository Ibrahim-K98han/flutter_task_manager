import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ScreenBackground2 extends StatelessWidget {
  final Widget widget;
  const ScreenBackground2({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return  Stack(
      children: [
        SvgPicture.asset(
          'assets/images/background.svg',
          width: screenSize.width,
          height: screenSize.height,
          fit: BoxFit.cover,
        ),
        widget
      ],
    );
  }
}