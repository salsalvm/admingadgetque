import 'dart:io';

import 'package:admin/view/core/color.dart';
import 'package:admin/view/widget/item_text.dart';
import 'package:flutter/material.dart';


class AddProductImage extends StatelessWidget {
  AddProductImage({
    Key? key,
    required this.heightI,
    required this.widthI,
    required this.image,
    required this.widthC,
    required this.noImage,
    required this.onTap,
  }) : super(key: key);
  final double heightI;
  final double widthI;
  final double widthC;
  final ImageProvider<Object> image;
  final bool noImage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: heightI,
          width: widthI,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            image: DecorationImage(
              filterQuality: FilterQuality.high,
              fit: BoxFit.fill,
              image: image,
            ),
          ),
          child: Visibility(
            visible: noImage,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.camera_alt,
                  color: kBlack54Color,
                ),
                  
                ItemText(name: 'No Image', color: kGreyColor),
              ],
            )),
          ),
        ),
        Container(
          width: widthC,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: kBoxColor),
          child: IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: onTap,
            color: kGreen,
          ),
        ),
      ],
    );
  }
}
