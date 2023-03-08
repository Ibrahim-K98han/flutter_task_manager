import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppTextFieldWidget extends StatelessWidget {
  const AppTextFieldWidget(
      {super.key,
      required this.hintText,
      required this.controller,
      this.obscureText, this.maxLines, this.validator, this.readOnly, this.keyboardType});
  final String hintText;
  final TextEditingController controller;
  final bool? obscureText;
  final int? maxLines;
  final Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText ?? false,
      maxLines: maxLines ?? 1,
      readOnly:  readOnly ?? false,
      validator: (value){
        if(validator !=null){
          return validator!(value);
        }
        return null;
      },
      decoration: InputDecoration(
          fillColor: Colors.white,
          hintText: hintText,
          filled: true,
          border: const OutlineInputBorder(borderSide: BorderSide.none)),
    );
  }
}
