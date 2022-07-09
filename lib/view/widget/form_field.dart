import 'package:admin/view/core/color.dart';
import 'package:admin/view/core/radius.dart';
import 'package:flutter/cupertino.dart';

class FormFields extends StatelessWidget {
  FormFields({
    Key? key,
    required this.name,
    required this.color,
    this.size = 20,
    this.inputTextColor,
    this.textColor = kGreyColor,
    this.obscureText = false,
    this.icon,
    this.controller,
  }) : super(key: key);
  final String name;
  final obscureText;
  final Color color;
  final Color textColor;
  final double size;
  final icon;
  // final double? fontSize;
  final Color? inputTextColor;
  final controller;
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      style: TextStyle(fontSize: 20,
        color: inputTextColor,
      ),
      placeholder: '  $name...',
      controller: controller,
      obscuringCharacter: '*',
      placeholderStyle: TextStyle(
        color: textColor,
        fontSize: size,
        fontWeight: FontWeight.w400,
      ),
      prefix: Padding(
        padding: const EdgeInsets.all(10),
        child: Icon(
          icon,
          color: kGreyColor,
        ),
      ),
      obscureText: obscureText,
      decoration: BoxDecoration(
        color: color,
        borderRadius: kRAdius10,
      ),
    );
  }
}
