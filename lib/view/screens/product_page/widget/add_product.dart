import 'dart:io';
import 'dart:ui';
import 'package:admin/controller/category_controller.dart';
import 'package:admin/controller/product_controller.dart';
import 'package:admin/view/constants/color.dart';
import 'package:admin/view/constants/enum.dart';
import 'package:admin/view/constants/radius.dart';
import 'package:admin/view/constants/space.dart';
import 'package:admin/view/screens/authentication/screen_login.dart';
import 'package:admin/view/screens/product_page/screen_product.dart';
import 'package:admin/view/screens/product_page/widget/dropdown_category.dart';
import 'package:admin/view/screens/product_page/widget/image_add_product.dart';
import 'package:admin/view/screens/widget/bottom_double_button.dart';
import 'package:admin/view/screens/widget/form_field.dart';
import 'package:admin/view/screens/widget/item_text.dart';
import 'package:admin/view/screens/widget/main_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProduct extends StatefulWidget {
  final String? name;
  final String? image;
  final String? desc;
  final String? category;
  final String? oPrice;
  final String? price;
  final String? mainImage;
  final String? fImage;
  final String? sImage;
  const AddProduct({
    Key? key,
    required this.type,
    this.name,
    this.desc,
    this.category,
    this.oPrice,
    this.price,
    this.mainImage,
    this.fImage,
    this.sImage,
    this.image,
  }) : super(key: key);
  final ActionType type;

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  void initState() {
    if (widget.type == ActionType.isEditing) {
      nameController.text = widget.name!;
      descController.text = widget.desc!;
      priceController.text = widget.price!;
      oPriceController.text = widget.oPrice!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (controller) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: MainAppbar(
                  title: widget.type == ActionType.isAdding
                      ? 'Add Product'
                      : 'Edit Product',
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
                              noImage: widget.type == ActionType.isEditing
                                  ? false
                                  : controller.isMainDisplay.value,
                              image: controller.mainImage == null
                                  ? widget.type == ActionType.isEditing
                                      ? NetworkImage(
                                              'http://10.0.2.2:3000/product-image/${widget.fImage}/${widget.image}_1.jpg')
                                          as ImageProvider<Object>
                                      : FileImage(File('asset/mobile.png'))
                                  : FileImage(controller.mainImage!),
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
                                  image: controller.firstImage == null
                                      ? widget.type == ActionType.isEditing
                                          ? NetworkImage(
                                                  'http://10.0.2.2:3000/product-image/${widget.fImage}/${widget.image}_2.jpg')
                                              as ImageProvider<Object>
                                          : FileImage(
                                              File('asset/mobile.png'),
                                            )
                                      : FileImage(controller.firstImage!),
                                  onTap: () {
                                    controller.pickFImages();
                                  },
                                  noImage: widget.type == ActionType.isEditing
                                      ? false
                                      : controller.isFDisplay.value,
                                  heightI: 85,
                                  widthI: 130,
                                  widthC: 130),
                              kHeigt10,
                              // <<<<<<<<<<<<<<<<<<second image>>>>>>>>>>>>>>>>>>>>>
                              AddProductImage(
                                  noImage: widget.type == ActionType.isEditing
                                      ? false
                                      : controller.isSDisplay.value,
                                  image: controller.mainImage == null
                                      ? widget.type == ActionType.isEditing
                                          ? NetworkImage(
                                                  'http://10.0.2.2:3000/product-image/${widget.sImage}/${widget.image}_3.jpg')
                                              as ImageProvider<Object>
                                          : FileImage(File('asset/mobile.png'))
                                      : FileImage(controller.mainImage!),
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
                      // if (widget.type == ActionType.isEditing)
                      //   const DropdownCategoryList(),
                      // if (widget.type == ActionType.isAdding)
                      //   const DropdownCategoryList(),
                      widget.type == ActionType.isEditing
                          ? Center(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                height: size.height * .06,
                                decoration: BoxDecoration(
                                  color: kFormColor,
                                  borderRadius: kRAdius10,
                                ),
                                child: GetBuilder<CategoryController>(
                                  init: CategoryController(),
                                  builder: (controller) {
                                    return controller.categoryNames == null
                                        ? const Center(
                                            child: CircularProgressIndicator())
                                        : DropdownButton(
                                            itemHeight: 60,
                                            isDense: true,
                                            iconSize: 30,
                                            isExpanded: true,
                                            elevation: 0,
                                            alignment: Alignment.centerLeft,
                                            hint: Row(
                                              children: const [
                                                Icon(
                                                  Icons.category,
                                                  color: kWhiteColor,
                                                ),
                                                kWidth20,
                                                ItemText(
                                                  name: 'select category...',
                                                  color: kBlackColor,
                                                  weight: FontWeight.normal,
                                                )
                                              ],
                                            ),
                                            value: selectedvalue,
                                            items:
                                                controller.categoryNames!.map(
                                              (category) {
                                                return DropdownMenuItem(
                                                  value: category.category,
                                                  child: Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.category,
                                                        size: 22,
                                                        color: kWhiteColor,
                                                      ),
                                                      kWidth20,
                                                      ItemText(
                                                        name:
                                                            category.category ??
                                                                'un known',
                                                        color: kBlackColor,
                                                        fontSize: 20,
                                                        weight:
                                                            FontWeight.normal,
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                            ).toList(),
                                            onChanged: (value) async {
                                              selectedvalue = value.toString();
                                              controller.update();
                                            },
                                          );
                                  },
                                ),
                              ),
                            )
                          : DropdownCategoryList(),
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
                  controller.firstImage == null ||
                  controller.secondImage == null ||
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
                  fImage: controller.firstImage!,
                  sImage: controller.secondImage!,
                  name: name,
                );

                productcontroller.addProduct(productDetails);
              }
            },
          )
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
