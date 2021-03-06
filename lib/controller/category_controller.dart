import 'dart:developer';
import 'dart:io';

import 'package:admin/model/add_category_model.dart';
import 'package:admin/model/category_model.dart';
import 'package:admin/model/delete_category.dart';
import 'package:admin/model/services/category_services.dart';

import 'package:admin/view/core/color.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

class CategoryController extends GetxController {
  final pickImage = ImagePicker();
  File? categoryImage;
  var isErrorDisplay = true.obs;
  List<Category>? categoryNames;
  //>>>>>>>>>>>>>>>>>>>>>>get category<<<<<<<<<<<<<<<<<<<//
  getCategory() async {
    try {
      final response = await CategoryServicesEndPoint().checkCategory();

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = viewCategoryModelFromJson(response.data);

        categoryNames = datas.category.obs;

        update();
      }
    } catch (e) {
      log(e.toString());
    }
  }
  //>>>>>>>>>>>>>>>>>>>>>>add category<<<<<<<<<<<<<<<<<<<//

  addCategory(String name, File image) async {
    final img = await MultipartFile.fromFile(image.path,
        filename: image.path.split('/').last,
        contentType: MediaType('image', 'jpg'));
    FormData formdatas = FormData.fromMap({
      "Category": name,
      "Image": img,
    });
    try {
      final response = await CategoryServicesEndPoint().addCategory(formdatas);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = addCategoryModelFromJson(response.data);
        if (datas.success == true) {
          Get.back();

          Get.snackbar(
            'Product added  ',
            'successfully',
            colorText: kGreenColor,
            snackPosition: SnackPosition.BOTTOM,
            padding: const EdgeInsets.all(20),
          );
          categoryImage = null;
          imageCache.clear();
          isErrorDisplay = true.obs;
          log(categoryImage!.toString());
          getCategory();
          update();
        }
      }
    } catch (e) {
      log('>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<');
    }
  }
  //>>>>>>>>>>>>>>>>>>>>>>delete category<<<<<<<<<<<<<<<<<<<//

  deleteCategory(String? categoryId) async {
    try {
      final respose =
          await CategoryServicesEndPoint().deleteCategory(categoryId!);

      if (respose!.statusCode == 200 || respose.statusCode == 201) {
        final datas = deleteCategoryModelFromJson(respose.data);
        Get.back();
        if (datas.acknowledged == true) {
          Get.snackbar('product deletted', 'success fully',
              colorText: kGreen, snackPosition: SnackPosition.BOTTOM);
        }
        getCategory();
      }
    } catch (e) {
      log('controller delete>>>>>>>>>>>>>$e<<<<<<<<<<<<<<');
    }
  }
  //>>>>>>>>>>>>>>>>>>>>>>.update category<<<<<<<<<<<<<<<<<<<//

  updateCategory() {}
  //>>>>>>>>>>>>>>>>>>>>>>pick image<<<<<<<<<<<<<<<<<<<//

  pickCategoryImage() async {
    XFile? pickedImage = await pickImage.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    categoryImage = File(pickedImage!.path);
    isErrorDisplay = false.obs;

    update();
  }

  @override
  void onInit() {
    getCategory();
    super.onInit();
  }
}
