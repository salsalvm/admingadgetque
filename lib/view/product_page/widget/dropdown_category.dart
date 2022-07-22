import 'package:admin/controller/category_controller.dart';
import 'package:admin/view/authentication/screen_login.dart';
import 'package:admin/view/core/color.dart';
import 'package:admin/view/core/radius.dart';
import 'package:admin/view/core/space.dart';
import 'package:admin/view/widget/item_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

String? selectedvalue;

class DropdownCategoryList extends StatelessWidget {
  const DropdownCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
                    ? const Center(child: CircularProgressIndicator())
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
                        items: controller.categoryNames!.map(
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
                                    name: category.category ?? 'un known',
                                    color: kBlackColor,
                                    fontSize: 20,
                                    weight: FontWeight.normal,
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
            )));
  }
}
