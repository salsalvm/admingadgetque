import 'package:admin/controller/category_controller.dart';
import 'package:admin/view/constants/color.dart';
import 'package:admin/view/constants/enum.dart';
import 'package:admin/view/constants/radius.dart';
import 'package:admin/view/constants/space.dart';
import 'package:admin/view/screens/authentication/screen_login.dart';
import 'package:admin/view/screens/category_page/widget/add_category.dart';
import 'package:admin/view/screens/widget/item_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .82,
      width: size.width,
      decoration: BoxDecoration(borderRadius: kRAdius10),
      child: GetBuilder<CategoryController>(
        init: CategoryController(),
        builder: (controller) => controller.categoryNames == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (context, index) => GestureDetector(
                  child: Slidable(
                    endActionPane: ActionPane(
                      extentRatio: 1 / 2,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            Get.defaultDialog(
                                backgroundColor: kBoxColor,
                                buttonColor: kButtonColor,
                                middleText: 'Do you Want to Remove',
                                onConfirm: () {
                                  controller.deleteCategory(
                                      controller.categoryNames![index].id);
                                },
                                title: 'Are You Sure',
                                onCancel: () {});
                          },
                          backgroundColor: kredColor,
                          foregroundColor: kWhiteColor,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                        SlidableAction(
                          onPressed: (context) {
                            Get.dialog(
                              AddCategory(
                                name:
                                    controller.categoryNames![index].category!,
                                type: ActionType.isEditing,
                                categoryId: controller.categoryNames![index].id,
                              ),
                            );
                          },
                          backgroundColor: kYellowColor,
                          foregroundColor: kBlackColor,
                          icon: Icons.edit,
                          label: 'Update',
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: kRAdius10,
                        ),
                        shadowColor: kGreyColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              kWidth5,
                              CircleAvatar(
                                radius: 17,
                                backgroundColor: kBlack54Color,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 4.0, bottom: 3),
                                  child: CustomText(
                                      name: '${index + 1}', color: kWhiteColor),
                                ),
                              ),
                              kWidth5,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: size.width * .435,
                                    child: CustomText(
                                        name: controller.categoryNames![index]
                                                .category ??
                                            'Un known',
                                        weight: FontWeight.bold,
                                        fontSize: 22,
                                        color: kBlackColor),
                                  ),
                                ],
                              ),
                              CachedNetworkImage(
                                imageUrl:
                                    'http://10.0.2.2:3000/category-image/${controller.categoryNames![index].id}.jpg',
                                height: size.width * .18,
                                width: size.width * .2,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, str, error) =>
                                    CachedNetworkImage(
                                  imageUrl:
                                      'http://10.0.2.2:3000/category-image/${controller.categoryNames![index].id}.jpg',
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, str, error) =>
                                      const Icon(
                                    Icons.error,
                                    color: kGreyColor,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                itemCount: controller.categoryNames!.length,
              ),
      ),
    );
  }
}
