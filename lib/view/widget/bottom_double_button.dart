import 'package:admin/view/core/color.dart';
import 'package:admin/view/authentication/screen_login.dart';
import 'package:admin/view/widget/action_button.dart';
import 'package:flutter/material.dart';

class BottomDoubleButton extends StatelessWidget {
  const BottomDoubleButton({
    Key? key,
    required this.secondText,
    required this.firstText,
    required this.firstOnTap,
    required this.secondOnTap,
  }) : super(key: key);
  final String secondText;
  final String firstText;
  final VoidCallback firstOnTap;

  final VoidCallback secondOnTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ActionButton(
          radius: 0,
          buttonColor: kGreyColor,
          fontColor: kBlackColor,
          buttonWidth: size.width * .5,
          buttonHeight: size.width * 0.14,
          text: firstText,
          onTap: firstOnTap,
        ),
        ActionButton(
            radius: 0,
            buttonColor: kBoxColor,
            buttonWidth: size.width * .5,
            buttonHeight: size.width * 0.14,
            text: secondText,
            fontColor: kBlackColor,
            onTap: secondOnTap)
      ],
    );
  }
}
