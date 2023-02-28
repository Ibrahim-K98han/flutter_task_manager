import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_task_manager/data/network_utils.dart';
import 'package:flutter_task_manager/data/urls.dart';

import '../utils/snackbar_message.dart';
import '../utils/text_style.dart';
import '../widgets/app_elevated_button.dart';
import '../widgets/app_text_field_widget.dart';
import '../widgets/screen_background_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailEtController = TextEditingController();
  final TextEditingController firstNameEtController = TextEditingController();
  final TextEditingController lastNameEtController = TextEditingController();
  final TextEditingController mobileEtController = TextEditingController();
  final TextEditingController passwordEtController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      'Join with us',
                      style: screenTitleTextStyle,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    AppTextFieldWidget(
                      hintText: 'Email',
                      controller: emailEtController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AppTextFieldWidget(
                      hintText: 'First Name',
                      controller: firstNameEtController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your First Name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AppTextFieldWidget(
                      hintText: 'Last Name',
                      controller: lastNameEtController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your Last Name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AppTextFieldWidget(
                      keyboardType: TextInputType.number,
                      hintText: 'Mobile',
                      controller: mobileEtController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your Mobile';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AppTextFieldWidget(
                      hintText: 'Password',
                      controller: passwordEtController,
                      validator: (value) {
                        if ((value?.isEmpty ?? true) &&
                            ((value?.length ?? 0) < 6)) {
                          return 'Enter Password more than 6 letter';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if(_isLoading)
                      Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      )
                    else
                    AppElevatedButton(
                        child: const Icon(Icons.arrow_circle_right_outlined),
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            _isLoading = true;
                            setState(() {

                            });
                            final result = await NetworkUtils().postMethod(
                              Urls.registrationUrl,
                                body: {
                                  'email': emailEtController.text.trim(),
                                  'mobile': mobileEtController.text.trim(),
                                  'password': passwordEtController.text,
                                  'firstName':
                                      firstNameEtController.text.trim(),
                                  'lastName': lastNameEtController.text.trim()
                                });
                            _isLoading = false;
                            setState(() {

                            });
                            if (result != null &&
                                result['status'] == 'success') {
                              emailEtController.clear();
                              mobileEtController.clear();
                              passwordEtController.clear();
                              firstNameEtController.clear();
                              lastNameEtController.clear();
                              showSnackBarMessage(
                                  context, 'Registration Successfull');
                            } else {
                              showSnackBarMessage(context,
                                  'Registration failed try again', true);
                            }
                          }
                          Navigator.pop(context);
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Have Account ?"),
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
        ),
      ),
    );
  }
}
