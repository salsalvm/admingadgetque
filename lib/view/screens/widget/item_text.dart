import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.name,
    required this.color,
    this.strike,
    this.lines = 1,
    this.weight = FontWeight.w500,
    this.fontSize = 18,
    this.onTap,
  }) : super(key: key);
  final String name;
  final FontWeight weight;
  final double fontSize;
  final color;
  final onTap;

  final lines;
  final TextDecoration? strike;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3, left: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          name,
          overflow: TextOverflow.ellipsis,
          maxLines: lines,
          style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontWeight: weight,
              decoration: strike),
        ),
      ),
    );
  }
}
