import 'package:flutter/material.dart';
import 'package:flutter_task_manager/data/network_utils.dart';
import 'package:flutter_task_manager/data/urls.dart';
import 'package:flutter_task_manager/ui/utils/snackbar_message.dart';
import 'package:flutter_task_manager/ui/utils/text_style.dart';
import 'package:flutter_task_manager/ui/widgets/app_elevated_button.dart';
import 'package:flutter_task_manager/ui/widgets/app_text_field_widget.dart';
import 'package:flutter_task_manager/ui/widgets/screen_background_widget.dart';
import 'package:flutter_task_manager/ui/widgets/user_profile_widget.dart';

import '../../data/auth_util.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _subjectETController = TextEditingController();
  final TextEditingController _descriptionETController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            'Add New Task',
                            style: screenTitleTextStyle,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          AppTextFieldWidget(
                              hintText: 'Subject',
                              controller: _subjectETController,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Enter your Subject';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          AppTextFieldWidget(
                            hintText: 'Description',
                            controller: _descriptionETController,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Enter your Task Description';
                              }
                              return null;
                            },
                            maxLines: 5,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          if(_isLoading)
                            Center(
                              child: CircularProgressIndicator(
                                color: Colors.green,
                              ),
                            )
                          else
                          AppElevatedButton(
                              child: Icon(Icons.arrow_circle_right_outlined),
                              onTap: ()async{
                                if(_formKey.currentState!.validate()){
                                  _isLoading = true;
                                  setState(() {

                                  });
                                  final result = await NetworkUtils().postMethod(
                                    Urls.createNewTaskUrl,
                                    body: {
                                        "title":_subjectETController.text.trim(),
                                        "description":_descriptionETController.text.trim(),
                                        "status":"New"
                                    },
                                  );
                                  _isLoading = false;
                                  setState(() {

                                  });
                                  if(result != null && result['status']=='success'){
                                    _subjectETController.clear();
                                    _descriptionETController.clear();
                                    showSnackBarMessage(context, 'New Task Added');
                                  }else{
                                    showSnackBarMessage(context, 'New Task Add Failed Try Again',true);
                                  }
                                }
                              })
                        ],
                      ),
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
