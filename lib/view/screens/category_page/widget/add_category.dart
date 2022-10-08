import 'dart:io';
import 'dart:ui';

import 'package:admin/controller/category_controller.dart';
import 'package:admin/view/constants/color.dart';
import 'package:admin/view/constants/enum.dart';
import 'package:admin/view/constants/space.dart';
import 'package:admin/view/screens/authentication/screen_login.dart';
import 'package:admin/view/screens/product_page/widget/image_add_product.dart';
import 'package:admin/view/screens/widget/action_button.dart';
import 'package:admin/view/screens/widget/form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({
    Key? key,
    this.name,
    required this.type,
    this.categoryId,
  }) : super(key: key);
  final String? name;
  final ActionType type;
  final String? categoryId;

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final nameController = TextEditingController();

  @override
  void initState() {
    if (widget.type == ActionType.isEditing) {
      nameController.text = widget.name!;
    }

    super.initState();
  }

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
                        image: controller.categoryImage == null
                            ? widget.type == ActionType.isEditing
                                ? NetworkImage(
                                    'http://10.0.2.2:3000/category-image/${widget.categoryId}.jpg',
                                  ) as ImageProvider<Object>
                                : FileImage(
                                    File("asset/mobile.png"),
                                  )
                            : FileImage(controller.categoryImage!),
                        widthC: size.width,
                        noImage: widget.type == ActionType.isEditing
                            ? false
                            : controller.isErrorDisplay.value,
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
                      text: widget.type == ActionType.isAdding ? 'Add' : "Edit",
                      buttonColor: kFormColor,
                      onTap: () {
                        final name = nameController.text.trim();

                        if (widget.type == ActionType.isAdding) {
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
                        } else {
                          controller.updateCategory(widget.categoryId!, name);
                        }
                      },
                    ),
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
