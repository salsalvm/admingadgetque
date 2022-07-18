import 'dart:developer';

import 'dart:io';

import 'package:admin/model/product/product_model.dart';
import 'package:admin/model/services/product_services.dart';
import 'package:admin/view/core/color.dart';
import 'package:admin/view/product_page/screen_product.dart';
import 'package:admin/view/product_page/widget/add_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';

class ProductController extends GetxController {
  final pickImage = ImagePicker();
  File? mainImage;
  File? fImage;
  File? sImage;
  var isMainDisplay = true.obs;
  var isFDisplay = true.obs;
  var isSDisplay = true.obs;
  List<Product>? product;
  //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>get datas<<<<<<<<<<<<<<<<<<<<<<<<<<//
  getDatas() async {
    try {
      final response = await ProductServicesEndPoint().getProductDatas();

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = productDatasModelFromJson(response.data);

        product = datas.products.obs;

        update();
      }
    } catch (e) {
      log(e.toString());
    }
  }

//>>>>>>>>>>>>>>>pick images<<<<<<<<<<<<<<<<<<<<<<<//
  pickMainImages() async {
    final XFile? pickedFImage =
        await pickImage.pickImage(source: ImageSource.gallery);
    mainImage = File(pickedFImage!.path);

    // update();
    isMainDisplay = false.obs;
    update();
  }

  pickFImages() async {
    final XFile? pickedFImage =
        await pickImage.pickImage(source: ImageSource.gallery);
    fImage = File(pickedFImage!.path);
    isFDisplay = false.obs;
    update();
  }

  pickSImages() async {
    final XFile? pickedFImage =
        await pickImage.pickImage(source: ImageSource.gallery);
    sImage = File(pickedFImage!.path);
    isSDisplay = false.obs;
    update();
  }

//>>>>>>>>>>>>>>>>>>>>add product<<<<<<<<<<<<<<<<<<<<<<<<<<<//
  addProduct(AddProductDatas productDetails) async {
    Map<String, dynamic> productDatas = {
      "Name": productDetails.name,
      "Description": productDetails.desc,
      "Category": productDetails.desc,
      "originalPrice": productDetails.oPrice,
      "Price": productDetails.price,
      "image1": productDetails.mainImage,
      "image2": productDetails.fImage,
      "image3": productDetails.sImage
    };
    log('<<<<<<<<<<<<<<<${productDatas.toString()}>>>>>>>>>>>>>>>>>>');
    try {
      final response = await ProductServicesEndPoint().addProduct(productDatas);
      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = productDatasModelFromJson(response.data);
        if (datas.admin == true) {
          Get.snackbar(
            'Product added  ',
            'successfully',
            colorText: kGreenColor,
            snackPosition: SnackPosition.BOTTOM,
            padding: const EdgeInsets.all(20),
          );
          Get.offAll(const ScreenProduct());
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onInit() {
    getDatas();
    super.onInit();
  }
}
