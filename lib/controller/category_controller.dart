import 'dart:developer';
import 'dart:io';

import 'package:admin/model/category_model.dart';
import 'package:admin/model/services/category_services.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';

class CategoryController extends GetxController {
  final pickImage = ImagePicker();
  File? cImage;
  var isErrorDisplay = true.obs;
  List<Category>? categoryNames;
  getCategory() async {
    try {
      final response = await CategoryServicesEndPoint().checkCategory();

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = viewCategoryModelFromJson(response.data);

        categoryNames = datas.category.obs;
        log(categoryNames.toString());
        update();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  pickCategoryImage() async {
    XFile? pickedImage = await pickImage.pickImage(source: ImageSource.gallery);
    cImage = File(pickedImage!.path);
    isErrorDisplay = false.obs;
    update();
  }

  addCategory() {}
  @override
  void onInit() {
    getCategory();
    super.onInit();
  }
}
