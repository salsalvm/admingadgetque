import 'package:admin/view/core/color.dart';
import 'package:admin/view/core/radius.dart';
import 'package:flutter/cupertino.dart';

class FormFields extends StatelessWidget {
  FormFields({
    Key? key,
    required this.name,
    required this.color,
    this.size = 22,
    this.inputTextColor,
   
    this.textColor = kGreyColor,
  }) : super(key: key);
  final String name;
  final Color color;
  final Color textColor;
  final double size;
  // final double? fontSize;
  final Color? inputTextColor;
  @override
  Widget build(BuildContext context) {
    return CupertinoTextFormFieldRow(
      style: TextStyle(color: inputTextColor, ),
      placeholder: '  $name...',
      placeholderStyle: TextStyle(
        color: textColor,
        fontSize: size,
        fontWeight: FontWeight.w400,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: kRAdius10,
      ),
    );
  }
}
