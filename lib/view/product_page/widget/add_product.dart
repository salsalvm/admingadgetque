import 'dart:io';
import 'dart:ui';
import 'package:admin/controller/product/product_controller.dart';
import 'package:admin/view/core/color.dart';
import 'package:admin/view/core/space.dart';
import 'package:admin/view/product_page/screen_product.dart';
import 'package:admin/view/product_page/widget/addProduct_image.dart';
import 'package:admin/view/product_page/widget/dropdown_category.dart';
import 'package:admin/view/widget/bottom_double_button.dart';
import 'package:admin/view/widget/form_field.dart';
import 'package:admin/view/widget/main_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProduct extends StatelessWidget {
  AddProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (controller) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Scaffold(
            appBar: const PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: MainAppbar(
                  title: 'Add Product',
                )),
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView(
                    children: [
                      kHeigt30,
                      Row(
                        children: [
                          // <<<<<<<<<<<<<<<<<<main image>>>>>>>>>>>>>>>>>>>>>
                          AddProductImage(
                              noImage: controller.isMainDisplay.value,
                              image: controller.mainImage ??
                                  File('asset/mobile.png'),
                              onTap: () async {
                                controller.pickMainImages();
                              },
                              heightI: 230,
                              widthI: 215,
                              widthC: 215),
                          const Spacer(),
                          Column(
                            children: [
                              // <<<<<<<<<<<<<<<<<<first image>>>>>>>>>>>>>>>>>>>>>
                              AddProductImage(
                                  noImage: controller.isFDisplay.value,
                                  image: controller.fImage ??
                                      File('asset/mobile.png'),
                                  onTap: () async {
                                    controller.pickFImages();
                                  },
                                  heightI: 85,
                                  widthI: 130,
                                  widthC: 130),
                              kHeigt10,
                              // <<<<<<<<<<<<<<<<<<second image>>>>>>>>>>>>>>>>>>>>>
                              AddProductImage(
                                  noImage: controller.isSDisplay.value,
                                  image: controller.sImage ??
                                      File('asset/mobile.png'),
                                  onTap: () async {
                                    controller.pickSImages();
                                  },
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
                          controller: nameController,
                          name: 'product name',
                          color: kFormColor,
                          textColor: kBlack54Color),
                      FormFields(
                          validator: (data) {},
                          icon: Icons.abc,
                          size: 18,
                          controller: descController,
                          name: 'discription',
                          color: kFormColor,
                          textColor: kBlack54Color),
                      const DropdownCategoryList(),
                      kHeigt10,
                      FormFields(
                          validator: (data) {},
                          icon: Icons.currency_rupee,
                          size: 18,
                          name: 'offer price',
                          controller: oPriceController,
                          color: kFormColor,
                          textColor: kBlack54Color),
                      FormFields(
                          validator: (data) {},
                          icon: Icons.currency_rupee,
                          size: 18,
                          name: 'price',
                          controller: priceController,
                          color: kFormColor,
                          textColor: kBlack54Color),
                    ],
                  ),
                ),
              ),
            ),
          ),
          BottomDoubleButton(
              secondText: 'Add',
              firstText: 'Cancel',
              firstOnTap: () {
                Get.offAll(
                  const ScreenProduct(),
                );
              },
              secondOnTap: () {
                final name = nameController.text.trim();
                final desc = descController.text.trim();
                final oPrice = oPriceController.text.trim();
                final price = priceController.text.trim();
                final category = selectedvalue.toString();
                if (name.isEmpty ||
                    controller.fImage == null ||
                    controller.sImage == null ||
                    controller.mainImage == null ||
                    desc.isEmpty ||
                    oPrice.isEmpty ||
                    price.isEmpty ||
                    category.isEmpty) {
                  Get.snackbar(
                      snackPosition: SnackPosition.BOTTOM,
                      'fill the field',
                      'Every Fields Are Required',
                      colorText: kredColor);
                  return;
                } else {
                  final productDetails = AddProductDatas(
                    desc: desc,
                    oPrice: oPrice,
                    price: price,
                    mainImage: controller.mainImage!,
                    fImage: controller.fImage!,
                    sImage: controller.sImage!,
                    name: name,
                  );

                  productcontroller.addProduct(
                    productDetails,
                  );
                }
              })
        ],
      ),
    );
  }

  final nameController = TextEditingController();
  final descController = TextEditingController();
  final oPriceController = TextEditingController();
  final priceController = TextEditingController();
  final productcontroller = Get.put(ProductController());
}

class AddProductDatas {
  final String name;
  final String desc;
  final String oPrice;
  final String price;

  final File mainImage;
  final File fImage;
  final File sImage;
  AddProductDatas(
      {required this.desc,
      required this.oPrice,
      required this.price,
      required this.mainImage,
      required this.fImage,
      required this.sImage,
      required this.name});
}
