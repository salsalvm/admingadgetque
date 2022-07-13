
import 'package:admin/view/core/color.dart';
import 'package:flutter/material.dart';

class AddProductImage extends StatelessWidget {
  const AddProductImage({
    Key? key, required this.heightI, required this.widthI, required this.widthC, required this.onTap,
  }) : super(key: key);
final double heightI;
final double widthI;
final double widthC;
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: heightI,
          width: widthI,
          decoration: const BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              image: DecorationImage(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                  image: AssetImage('asset/mobile.png'))),
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
