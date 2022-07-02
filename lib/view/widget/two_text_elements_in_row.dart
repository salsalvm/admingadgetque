import 'package:admin/view/core/color.dart';
import 'package:admin/view/widget/item_text.dart';
import 'package:flutter/material.dart';

class TextElementsInRow extends StatelessWidget {
  const TextElementsInRow({
    Key? key,
     this.paddding=15,
    required this.firstText,
    required this.secondText,
    required this.wieght,
    required this.fontSize,
    required this.fontColor, this.onTap,  this.sColor=kBlackColor,
  }) : super(key: key);
  final String firstText;
  final String secondText;
  final FontWeight wieght;
  final double fontSize;
  final Color fontColor;
  final double paddding;
  final Color sColor;
  final  onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ItemText(
            name: firstText,
            weight: wieght,
            fontSize: fontSize,
            color: fontColor),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: paddding),
          child: ItemText(onTap: onTap,
              name: secondText,
              weight: wieght,
              fontSize: fontSize,
              color: sColor,),
        ),
      ],
    );
  }
}
