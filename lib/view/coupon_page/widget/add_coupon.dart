import 'dart:ui';

import 'package:admin/view/core/color.dart';
import 'package:admin/view/core/space.dart';
import 'package:admin/view/authentication/screen_login.dart';
import 'package:admin/view/widget/action_button.dart';
import 'package:admin/view/widget/form_field.dart';

import 'package:flutter/material.dart';

class AddCoupon extends StatelessWidget {
  const AddCoupon({
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
            children: [
              FormFields(validator: (data) {
                
              },
                  size: 18,
                  name: 'coupon code',
                  color: kGreyColor,
                  textColor: kBlack54Color),
              FormFields(validator: (data) {
                
              },
                  size: 18,
                  name: 'coupon percentage',
                  color: kGreyColor,
                  textColor: kBlack54Color),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    ActionButton(
                      buttonWidth: 285,
                      fontColor: kBlackColor,
                      buttonHeight: 32,
                      fontSize: 20,
                      text: '20/04/2022                             ',
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2021, 1),
                          lastDate: DateTime(2022, 12),
                        ).then(
                          (pickedDate) {
                            DateTime.june;
                          },
                        );
                      },
                    ),
                    const Icon(Icons.calendar_month_rounded)
                  ],
                ),
              ),

              // GestureDetector( onTap: () {
              //         showDatePicker(
              //           context: context,
              //           initialDate: DateTime.now(),
              //           firstDate: DateTime(2021, 1),
              //           lastDate: DateTime(2022, 12),
              //         ).then((pickedDate) {
              //           DateTime.june;
              //         });
              //       },
              //   child: FormFields(
              //       size: 18,
              //       name: 'expire date',
              //       color: kGreyColor,
              //       textColor: kBlack54Color),
              // ),

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
                      onTap: () {}),
                  ActionButton(
                      buttonWidth: size.width * .35,
                      buttonHeight: 40,
                      fontColor: kWhiteColor,
                      fontSize: 20,
                      text: 'ADD OFFER',
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
