import 'package:admin/view/core/color.dart';
import 'package:admin/view/login/screen_login.dart';
import 'package:admin/view/widget/divider.dart';
import 'package:admin/view/widget/item_text.dart';
import 'package:flutter/material.dart';

class GraphScheduled extends StatelessWidget {
  const GraphScheduled({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ItemText(
          weight: FontWeight.bold,
          name: title ,
          fontSize: 22,
          color: kBlackColor,
        ),
        const DivLine(),
        Container(
          width: size.width,
          height: size.width * .6,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'asset/graph.png',
                ),
                filterQuality: FilterQuality.high),
          ),
        ),
      ],
    );
  }
}
