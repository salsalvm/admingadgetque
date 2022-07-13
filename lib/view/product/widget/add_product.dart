import 'dart:ui';

import 'package:admin/view/core/color.dart';
import 'package:admin/view/core/space.dart';
import 'package:admin/view/product/widget/addProduct_image.dart';
import 'package:admin/view/widget/bottom_double_button.dart';
import 'package:admin/view/widget/form_field.dart';
import 'package:admin/view/widget/main_appbar.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: MainAppbar(
            title: 'Add Product',
          )),
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView(
                  children: [
                    Row(
                      children: [
                        // <<<<<<<<<<<<<<<<<<main image>>>>>>>>>>>>>>>>>>>>>
                        AddProductImage(
                            onTap: () {},
                            heightI: 230,
                            widthI: 215,
                            widthC: 215),
                        const Spacer(),
                        Column(
                          children: [
                            // <<<<<<<<<<<<<<<<<<first image>>>>>>>>>>>>>>>>>>>>>
                            AddProductImage(
                                onTap: () {},
                                heightI: 85,
                                widthI: 130,
                                widthC: 130),
                            kHeigt10,
                            // <<<<<<<<<<<<<<<<<<second image>>>>>>>>>>>>>>>>>>>>>
                            AddProductImage(
                                onTap: () {},
                                heightI: 85,
                                widthI: 130,
                                widthC: 130),
                          ],
                        )
                      ],
                    ),
                    kHeigt30,
                    FormFields(
                        validator: (data) {},
                        icon: Icons.abc,
                        size: 18,
                        name: 'product name',
                        color: kFormColor,
                        textColor: kBlack54Color),
                    FormFields(
                        validator: (data) {},
                        icon: Icons.abc,
                        size: 18,
                        name: 'discription',
                        color: kFormColor,
                        textColor: kBlack54Color),
                    FormFields(
                        validator: (data) {},
                        icon: Icons.currency_rupee,
                        size: 18,
                        name: 'offer price',
                        color: kFormColor,
                        textColor: kBlack54Color),
                    FormFields(
                        validator: (data) {},
                        icon: Icons.currency_rupee,
                        size: 18,
                        name: 'price',
                        color: kFormColor,
                        textColor: kBlack54Color),
                    FormFields(
                        validator: (data) {},
                        icon: Icons.category,
                        size: 18,
                        name: 'catogoy',
                        color: kFormColor,
                        textColor: kBlack54Color),
                  ],
                ),
              ),
            ),
            BottomDoubleButton(
                secondText: 'Add',
                firstText: 'Cancel',
                firstOnTap: () {},
                secondOnTap: () {})
          ],
        ),
      ),
    );
  }
}
