import 'package:flutter/material.dart';
import 'package:flutter_task_manager/data/network_utils.dart';
import 'package:flutter_task_manager/data/urls.dart';
import 'package:flutter_task_manager/ui/screen/login.dart';
import 'package:flutter_task_manager/ui/screen/reset_password_screen.dart';
import 'package:flutter_task_manager/ui/utils/snackbar_message.dart';
import 'package:flutter_task_manager/ui/widgets/app_elevated_button.dart';
import 'package:flutter_task_manager/ui/widgets/screen_background_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utils/text_style.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;

  const OtpVerificationScreen({Key? key, required this.email})
      : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpPinETController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pin Verification',
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
                PinCodeTextField(
                  controller: _otpPinETController,
                  keyboardType: TextInputType.number,
                  appContext: context,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      selectedColor: Colors.black,
                      activeColor: Colors.grey,
                      inactiveColor: Colors.grey,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white),
                  animationDuration: const Duration(milliseconds: 3),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onCompleted: (v) {},
                  onChanged: (value) {
                    setState(() {});
                  },
                  beforeTextPaste: (text) {
                    return true;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                AppElevatedButton(
                    child: const Text('Verify'),
                    onTap: () async {
                      final response = await NetworkUtils().getMethod(
                          Urls.recoverVerifyOTPUrl(
                              widget.email, _otpPinETController.text.trim()));
                      if (response != null && response['status'] == 'success') {
                        if (mounted) {
                          showSnackBarMessage(
                              context, 'OTP verification done!');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResetPasswordScreen(
                                email: widget.email,
                                otp: _otpPinETController.text,
                              ),
                            ),
                          );
                        } else {
                          if (mounted) {
                            showSnackBarMessage(
                                context,
                                'OTP Verification failed ! Check your otp',
                                true);
                          }
                        }
                      }
                    }),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Have account"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                              (route) => false);
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
