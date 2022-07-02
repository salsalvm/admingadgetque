import 'dart:ui';

import 'package:admin/view/core/color.dart';
import 'package:admin/view/core/radius.dart';
import 'package:admin/view/core/space.dart';
import 'package:admin/view/login/screen_login.dart';
import 'package:admin/view/widget/action_button.dart';
import 'package:admin/view/widget/form_field.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({
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
                    height: 180,
                    width: 160,
                    decoration:const BoxDecoration(
                       borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        ),
                        image:  DecorationImage(
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                            image: AssetImage('asset/mobile.png'))),
                  ),
                  Container(
                    height: 25,
                    width: 160,
                    decoration:const BoxDecoration(
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
              FormFields(size: 18,
                  name: 'product name',
                  color: kGreyColor,
                  textColor: kBlack54Color),
              FormFields(size: 18,
                  name: 'discription',
                  color: kGreyColor,
                  textColor: kBlack54Color),
              FormFields(size: 18,
                  name: 'price', color: kGreyColor, textColor: kBlack54Color),
              FormFields(size: 18,
                  name: 'offer price',
                  color: kGreyColor,
                  textColor: kBlack54Color),
              FormFields(size: 18,
                  name: 'delivery charge',
                  color: kGreyColor,
                  textColor: kBlack54Color),
              FormFields(size: 18,
                  name: 'catogoy', color: kGreyColor, textColor: kBlack54Color),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  kWidth5,
                  ActionButton(
                      buttonWidth: size.width * .35,
                      fontSize: 20,
                      buttonHeight: 40,
                      text: 'CANCEL',
                      buttonColor: kFormColor,
                      fontColor: kWhiteColor,
                      onTap: () {
                        
                      }),
                  ActionButton(
                      buttonWidth: size.width * .35,
                      buttonHeight: 40,
                      fontColor: kWhiteColor,
                      fontSize: 20,
                      text: 'ADD',
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
