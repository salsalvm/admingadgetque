import 'dart:developer';
import 'dart:io';

import 'package:admin/model/category/add_category_model.dart';
import 'package:admin/model/category/category_model.dart';
import 'package:admin/model/category/delete_category.dart';
import 'package:admin/services/category_services.dart';
import 'package:admin/model/category/update_category_model.dart';
import 'package:admin/view/constants/color.dart';
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
 //------------------get-------------------//
  getCategory() async {
    try {
      final response = await CategoryServicesEndPoint().getCategory();

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = viewCategoryModelFromJson(response.data);

        categoryNames = datas.category.obs;

        update();
      }
    } catch (e) {
      log('get controller>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<');
    }
  }
 //------------------add-------------------//

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
        if (datas.success) {
          getCategory();
          update();
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
        }
      }
    } catch (e) {
      log('add controller>>>>>>>>>>>>>>$e<<<<<<<<<<<<<<<<');
    }
  }
 //------------------delete-------------------//

  deleteCategory(String? categoryId) async {
    try {
      final respose =
          await CategoryServicesEndPoint().deleteCategory(categoryId!);

      if (respose!.statusCode == 200 || respose.statusCode == 201) {
        final datas = deleteCategoryModelFromJson(respose.data);

        if (datas.acknowledged) {
          getCategory();
          update();
          Get.back();
          if (datas.acknowledged == true) {
            Get.snackbar('product deletted', 'success fully',
                colorText: kGreen, snackPosition: SnackPosition.BOTTOM);
          }
        }
      }
    } catch (e) {
      log('controller delete>>>>>>>>>>>>>$e<<<<<<<<<<<<<<');
    }
  }
  //------------------update-------------------//

  updateCategory(
    String categoryId,
    String catName,
  ) async {
    final image = await MultipartFile.fromFile(categoryImage!.path,
        contentType: MediaType('image', 'jpg'),
        filename: categoryImage!.path.split('/').last);

    FormData formdatas = FormData.fromMap({
      "Category": catName,
      "Image": image,
    });
    try {
      final response = await CategoryServicesEndPoint()
          .updateCategory(categoryId, formdatas);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = updateCategoryModelFromJson(response.data);

        if (datas.success) {
          getCategory();
          update();
          Get.back();
          Get.snackbar('product updatted', 'success fully',
              colorText: kGreen, snackPosition: SnackPosition.BOTTOM);
        }
      }
    } catch (e) {
      log('controller update>>>>>>>>>>>>>$e<<<<<<<<<<<<<<');
    }
  }
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
