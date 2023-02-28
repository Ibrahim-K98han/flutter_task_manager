import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_task_manager/data/auth_util.dart';
import 'package:flutter_task_manager/data/network_utils.dart';
import 'package:flutter_task_manager/data/urls.dart';
import 'package:flutter_task_manager/ui/screen/main_botton_nav_bar.dart';
import 'package:flutter_task_manager/ui/screen/sign_up_screen.dart';
import 'package:flutter_task_manager/ui/screen/verify_with_email_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/snackbar_message.dart';
import '../utils/text_style.dart';
import '../widgets/app_elevated_button.dart';
import '../widgets/app_text_field_widget.dart';
import '../widgets/screen_background_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailEtController = TextEditingController();
  final TextEditingController _passwordEtController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<void> login() async {
    _isLoading = true;
    setState(() {

    });
    final result = await NetworkUtils()
        .postMethod(
        Urls.loginUrl,
        body: {
          'email': _emailEtController.text.trim(),
          'password': _passwordEtController.text
        },
        onUnAuthorize: (){
          showSnackBarMessage(context, 'Username or Password incorrect', true);
        }
    );
    _isLoading = false;
    setState(() {

    });
    if (result != null && result['status'] == 'success') {
      await AuthUtils.saveUserData(
          result['data']['firstName'],
          result['data']['lastName'],
          result['token'],
          result['data']['photo'],
          result['data']['mobile'],
          result['data']['email'],
      );

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => const MainBottomNavbar()),
              (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Get Started With',
                  style: screenTitleTextStyle,
                ),
                const SizedBox(
                  height: 24,
                ),
                AppTextFieldWidget(
                  controller: _emailEtController,
                  hintText: 'Email',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                AppTextFieldWidget(
                  obscureText: true,
                  hintText: 'Password',
                  controller: _passwordEtController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                if(_isLoading)
                  const Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  )
                else
                AppElevatedButton(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      login();
                    }
                    //Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_circle_right_outlined),
                ),
                const SizedBox(
                  height: 24,
                ),
                Center(
                    child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const VerifyWithEmailScreen()));
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey),
                        ))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: const Text(
                          'Sign Up',
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
