import 'dart:developer';

import 'dart:io';

import 'package:admin/model/add_product_model.dart';
import 'package:admin/model/delete_product.dart';
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
  File? firstImage;
  File? secondImage;
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

//>>>>>>>>>>>>>>>>>>>>add product<<<<<<<<<<<<<<<<<<<<<<<<<<<//
  addProduct(AddProductDatas productDetails) async {
    String fileName1 = productDetails.mainImage.path.split('/').last;
    String fileName2 = productDetails.fImage.path.split('/').last;
    String fileName3 = productDetails.sImage.path.split('/').last;

    final mImage = await MultipartFile.fromFile(productDetails.mainImage.path,
        filename: fileName1, contentType: MediaType('image', 'jpg'));
    final fImage = await MultipartFile.fromFile(productDetails.fImage.path,
        filename: fileName2, contentType: MediaType('image', 'jpg'));
    final sImage = await MultipartFile.fromFile(productDetails.sImage.path,
        filename: fileName3, contentType: MediaType('image', 'jpg'));

    FormData formData = FormData.fromMap({
      "Name": productDetails.name,
      "Description": productDetails.desc,
      "Category": productDetails.desc,
      "originalPrice": productDetails.oPrice,
      "Price": productDetails.price,
      "image1": mImage,
      "image2": fImage,
      "image3": sImage
    });

    try {
      final response = await ProductServicesEndPoint().addProduct(formData);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = addProductModelFromJson(response.data);

        if (datas.success) {
          Get.offAll(const ScreenProduct());
          getDatas();
          Get.snackbar(
            'Product added  ',
            'successfully',
            colorText: kGreenColor,
            snackPosition: SnackPosition.BOTTOM,
            padding: const EdgeInsets.all(20),
          );
        }
      }
    } on DioError catch (e) {
      log('controller dio>>>>>>>>>$e<<<<<<<<<<<');

      Get.snackbar(
        'Product added failed',
        'some issues occure',
        colorText: kredColor,
        snackPosition: SnackPosition.BOTTOM,
        padding: const EdgeInsets.all(20),
      );
    } catch (e) {
      log('controller  catch>>>>>>>>.$e<<<<<<<<<<<<<,');
      Get.snackbar(
        'Product added failed',
        'some network issues occure',
        colorText: kredColor,
        snackPosition: SnackPosition.BOTTOM,
        padding: const EdgeInsets.all(20),
      );
    }
  }

//>>>>>>>>>>>>>>>delete product<<<<<<<<<<<<<<<<<<<<<<<//
  deleteProduct(String? productId) async {
    try {
      final resoponse =
          await ProductServicesEndPoint().deleteProduct(productId!);

      if (resoponse!.statusCode == 200 || resoponse.statusCode == 201) {
        log(resoponse.data.toString());
        final datas = deleteProductModelFromJson(resoponse.data);

        if (datas.response.acknowledged == true) {
          Get.snackbar('product deletted', 'success fully',
              colorText: kGreen, snackPosition: SnackPosition.BOTTOM);
        }

        getDatas();
      }
    } catch (e) {
      Get.snackbar('error', 'product deleteing failed',
          colorText: kredColor, snackPosition: SnackPosition.BOTTOM);
      log('controller catch>>>>>>>>>>>>>>>>$e<<<<<<<<<<<<<');
    } finally {
      Get.back();
    }
  }

  //>>>>>>>>>>>>>>>update product<<<<<<<<<<<<<<<<<<<<<<<//
  updateProduct() {}
//>>>>>>>>>>>>>>>pick images<<<<<<<<<<<<<<<<<<<<<<<//
  pickMainImages() async {
    final XFile? pickedFImage = await pickImage.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    mainImage = File(pickedFImage!.path);
    isMainDisplay = false.obs;
    update();
  }

  pickFImages() async {
    final XFile? pickedFImage = await pickImage.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    firstImage = File(pickedFImage!.path);
    isFDisplay = false.obs;
    update();
  }

  pickSImages() async {
    final XFile? pickedFImage = await pickImage.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    secondImage = File(pickedFImage!.path);
    isSDisplay = false.obs;
    update();
  }

  @override
  void onInit() {
    getDatas();
    super.onInit();
  }
}
