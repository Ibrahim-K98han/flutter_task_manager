import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_task_manager/ui/screen/otp_verification_screen.dart';

import '../utils/text_style.dart';
import '../widgets/app_elevated_button.dart';
import '../widgets/app_text_field_widget.dart';
import '../widgets/screen_background_widget.dart';

class VerifyWithEmailScreen extends StatefulWidget {
  const VerifyWithEmailScreen({super.key});

  @override
  State<VerifyWithEmailScreen> createState() => _VerifyWithEmailScreenState();
}

class _VerifyWithEmailScreenState extends State<VerifyWithEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Email Address',
                  style: screenTitleTextStyle,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                    'A 6 digits verifictation pin will be send to your email address',
                    style: screenSubTitleStyle),
                const SizedBox(
                  height: 24,
                ),
                AppTextFieldWidget(
                    hintText: 'Email Address',
                    controller: TextEditingController()),
                const SizedBox(
                  height: 24,
                ),
                AppElevatedButton(
                    child: const Icon(Icons.arrow_circle_right_outlined),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const OtpVerificationScreen()));
                    }),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Have account"),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(color: Colors.green),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
