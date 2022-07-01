
import 'package:admin/view/core/color.dart';
import 'package:flutter/material.dart';

class DivLine extends StatelessWidget {
  const DivLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.only(top:5),
      child:  Divider(
        height: 3,thickness: 1,
        color: kGreyColor,
      ),
    );
  }
}