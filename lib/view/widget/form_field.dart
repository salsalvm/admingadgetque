
import 'package:admin/view/core/color.dart';
import 'package:admin/view/core/radius.dart';
import 'package:flutter/cupertino.dart';

class FormFields extends StatelessWidget {
  FormFields(
      {Key? key,
      required this.name,
      required this.color,
      this.size,
      this.inputTextColor,
      this.textColor = kGreyColor,
      this.obscureText = false,
      this.icon,
      this.controller,
    required  this.validator})
      : super(key: key);
  final String name;
  final  obscureText;
  final Color color;
  final Color textColor;
  final double? size;
  final icon;
  // final double? fontSize;
  final  validator;
  final Color? inputTextColor;
  final controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: CupertinoTextField(
        style: TextStyle(
          fontSize: 20,
          color: inputTextColor,
        ),
        placeholder: '  $name...',
        controller: controller,
        obscuringCharacter: '*',
        placeholderStyle: TextStyle(
          color: textColor,
          fontSize: size,
          fontWeight: FontWeight.w600,
        ),
        onChanged: validator,
        prefix: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(
            icon,
            color: kWhiteColor,
          ),
        ),
        obscureText: obscureText,
        decoration: BoxDecoration(
          color: color,
          borderRadius: kRAdius10,
        ),
      ),
    );
  }
}
