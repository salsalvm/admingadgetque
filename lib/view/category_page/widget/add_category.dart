import 'dart:io';
import 'dart:ui';

import 'package:admin/controller/category_controller.dart';
import 'package:admin/view/core/color.dart';
import 'package:admin/view/core/space.dart';
import 'package:admin/view/authentication/screen_login.dart';
import 'package:admin/view/product_page/widget/add_product.dart';
import 'package:admin/view/product_page/widget/image_add_product.dart';
import 'package:admin/view/widget/action_button.dart';
import 'package:admin/view/widget/form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCategory extends StatelessWidget {
  AddCategory({
    Key? key,
  }) : super(key: key);
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: GetBuilder<CategoryController>(
        init: CategoryController(),
        builder: (controller) => Dialog(
          backgroundColor: Colors.transparent,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    AddProductImage(
                        heightI: size.height * .35,
                        widthI: size.width,
                        image: controller.categoryImage ??
                            File('asset/mobile.png'),
                        widthC: size.width,
                        noImage: controller.isErrorDisplay.value,
                        onTap: () {
                          controller.pickCategoryImage();
                        }),
                  ],
                ),
                kHeigt10,
                FormFields(
                    controller: nameController,
                    validator: (data) {},
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
                        onTap: () {
                          Get.back();
                        }),
                    ActionButton(
                        buttonWidth: size.width * .38,
                        buttonHeight: 40,
                        fontColor: kWhiteColor,
                        fontSize: 20,
                        text: 'Add',
                        buttonColor: kFormColor,
                        onTap: () {
                          final name = nameController.text.trim();
                          if (name.isEmpty ||
                              controller.categoryImage == null) {
                            Get.snackbar(
                                snackPosition: SnackPosition.BOTTOM,
                                'fill the field',
                                'Every Fields Are Required',
                                colorText: kredColor);
                            return;
                          } else {
                            controller.addCategory(
                                name, controller.categoryImage!);
                                
                          }
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
