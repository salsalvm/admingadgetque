import 'package:admin/view/core/color.dart';
import 'package:flutter/material.dart';

class MainAppbar extends StatelessWidget {
  const MainAppbar({
    Key? key, required this.title,
  }) : super(key: key);
final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: kBlackColor,
      backgroundColor: kBoxColor,
      centerTitle: true,
      title:  Text(
        title,
        style:const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: kBlackColor,
        ),
      ),
    );
  }
}
