import 'dart:ui';

import 'package:admin/view/core/color.dart';
import 'package:admin/view/core/space.dart';
import 'package:admin/view/authentication/screen_login.dart';
import 'package:admin/view/widget/action_button.dart';
import 'package:admin/view/widget/form_field.dart';
import 'package:flutter/material.dart';

class AddCategory extends StatelessWidget {
  const AddCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                // alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    height: 260,
                    width: 280,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                            image: AssetImage('asset/mobile.png'))),
                  ),
                  Container(
                    height: 25,
                    width: 280,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color: kBoxColor),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: kGreen,
                    ),
                  )
                ],
              ),
              kHeigt10,
              FormFields(
                  size: 18,
                  icon: Icons.category,
                  name: 'category name',
                  color: kGreyColor,
                  textColor: kBlack54Color),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ActionButton(
                      buttonWidth: size.width * .38,
                      fontSize: 20,
                      buttonHeight: 40,
                      text: 'Cancel',
                      buttonColor: kFormColor,
                      fontColor: kWhiteColor,
                      onTap: () {}),
                  ActionButton(
                      buttonWidth: size.width * .38,
                      buttonHeight: 40,
                      fontColor: kWhiteColor,
                      fontSize: 20,
                      text: 'Add',
                      buttonColor: kFormColor,
                      onTap: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
