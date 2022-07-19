import 'dart:developer';

import 'dart:io';

import 'package:admin/model/product_model.dart';
import 'package:admin/model/services/product_services.dart';
import 'package:admin/view/core/color.dart';
import 'package:admin/view/product_page/screen_product.dart';
import 'package:admin/view/product_page/widget/add_product.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:http_parser/http_parser.dart';
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
    String fileName1 = productDetails.mainImage.path.split('/').last;
    String fileName2 = productDetails.fImage.path.split('/').last;
    String fileName3 = productDetails.sImage.path.split('/').last;

    final mainImage = MultipartFile.fromFile(productDetails.mainImage.path,
        filename: fileName1, contentType: MediaType('image', 'jpg'));
    final fImage = MultipartFile.fromFile(productDetails.fImage.path,
        filename: fileName2, contentType: MediaType('image', 'jpg'));
    final sImage = MultipartFile.fromFile(productDetails.sImage.path,
        filename: fileName3, contentType: MediaType('image', 'jpg'));

    FormData formData = FormData.fromMap({
      "Name": productDetails.name,
      "Description": productDetails.desc,
      "Category": productDetails.desc,
      "originalPrice": productDetails.oPrice,
      "Price": productDetails.price,
      "image1": mainImage,
      "image2": fImage,
      "image3": sImage
    });
    Map<String, String> requestHeadder = {
      "Content-Type": "multipart/form-data",
    };

    try {
      log('started'.toString());
      final response =
          await ProductServicesEndPoint().addProduct(requestHeadder, formData);
      log('success'.toString());
      log(response!.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final datas = productDatasModelFromJson(response.data);
        if (datas.admin == true) {
          log('trueAdmin'.toString());
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
    } on DioError catch (e) {
      log(e.toString());
      Get.snackbar(
        'Product added failed',
        'some issues occure',
        colorText: kredColor,
        snackPosition: SnackPosition.BOTTOM,
        padding: const EdgeInsets.all(20),
      );
    } catch (e) {
      log(e.toString());
      Get.snackbar(
        'Product added failed',
        'some network issues occure',
        colorText: kredColor,
        snackPosition: SnackPosition.BOTTOM,
        padding: const EdgeInsets.all(20),
      );
    }
  }

  @override
  void onInit() {
    getDatas();
    super.onInit();
  }
}
