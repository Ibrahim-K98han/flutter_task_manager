import 'package:flutter/material.dart';
import 'package:flutter_task_manager/ui/utils/text_style.dart';
import 'package:flutter_task_manager/ui/widgets/app_elevated_button.dart';
import 'package:flutter_task_manager/ui/widgets/app_text_field_widget.dart';
import 'package:flutter_task_manager/ui/widgets/screen_background_widget.dart';
import 'package:flutter_task_manager/ui/widgets/user_profile_widget.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileWidget(),
            Expanded(
              child: ScreenBackground(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          'Update Profile',
                          style: screenTitleTextStyle,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        InkWell(
                          onTap: (){},
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(8)
                                  )
                                ),
                                child: const Text('Photo',style: TextStyle(color: Colors.white),),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          bottomRight: Radius.circular(8)
                                      )
                                  ),
                                  child: const Text(''),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        AppTextFieldWidget(hintText: 'Email', controller: TextEditingController()),
                        const SizedBox(
                          height: 8,
                        ),
                        AppTextFieldWidget(hintText: 'First Name', controller: TextEditingController()),
                        const SizedBox(
                          height: 8,
                        ),
                        AppTextFieldWidget(hintText: 'Last Name', controller: TextEditingController()),
                        const SizedBox(
                          height: 8,
                        ),
                        AppTextFieldWidget(hintText: 'Mobile ', controller: TextEditingController()),
                        const SizedBox(
                          height: 8,
                        ),
                        AppTextFieldWidget(hintText: 'Password',
                            obscureText: true,
                            controller: TextEditingController()),
                        const SizedBox(
                          height: 16,
                        ),
                        AppElevatedButton(child: Icon(Icons.arrow_circle_right_outlined), onTap: (){})
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
