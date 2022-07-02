import 'package:admin/view/core/color.dart';
import 'package:admin/view/widget/two_text_elements_in_row.dart';
import 'package:flutter/material.dart';

class ReportLog extends StatelessWidget {
  const ReportLog(
      {Key? key,
      required this.fText,
      required this.sText,
      required this.height,  this.sColor=kBlackColor,  this.boxColor=kWhiteColor,this.fColor=kBlack54Color})
      : super(key: key);
  final String fText;
  final String sText;
  final double height;
  final Color sColor;
  final Color fColor;
  final Color boxColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
          // height: height,
          // decoration: BoxDecoration(
          //   borderRadius: kRAdius10,
          //   color: kBoxColor,
          // ),
color: boxColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextElementsInRow(sColor: sColor,
                firstText: fText,
                secondText: sText,
                wieght: FontWeight.bold,
                fontSize: 24,
                fontColor: fColor),
          )),
    );
  }
}
