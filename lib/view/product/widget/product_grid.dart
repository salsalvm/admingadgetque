import 'package:admin/controller/product/product_controller.dart';
import 'package:admin/view/core/color.dart';
import 'package:admin/view/core/radius.dart';
import 'package:admin/view/core/space.dart';
import 'package:admin/view/authentication/screen_login.dart';
import 'package:admin/view/widget/item_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height*.838,
      child: GetBuilder<ProductController>(
        init: ProductController(),
        builder: (controller) => controller.product == null
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
                shrinkWrap: true,
                itemCount: controller.product!.length,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 1 / 1.825,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Card(
                      color: kWhiteColor,
                      shape: RoundedRectangleBorder(borderRadius: kRAdius10),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Container(
                              width: size.width * .5,
                              height: size.width * .5,
                              decoration: BoxDecoration(
                                borderRadius: kRAdius10,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    'http://54.176.6.232/product-image/${controller.product![index].id}/${controller.product![index].imageId}_1.jpg',
                                  ),
                                ),
                              ),
                            ),
                            kHeigt5,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ItemText(
                                    name: controller.product![index].name
                                        .toUpperCase(),
                                    weight: FontWeight.bold,
                                    fontSize: 18,
                                    color: kBlackColor),
                                SizedBox(
                                  child: ItemText(
                                      lines: 2,
                                      name: controller
                                          .product![index].description,
                                      weight: FontWeight.w400,
                                      fontSize: 16,
                                      color: kBlack54Color),
                                ),
                                // kHeigt5,
                                ItemText(
                                    name: controller.product![index].category,
                                    weight: FontWeight.w500,
                                    fontSize: 18,
                                    color: kBlackColor),
                                Row(
                                  children: [
                                    ItemText(
                                        name: controller
                                            .product![index].originalPrice,
                                        weight: FontWeight.bold,
                                        fontSize: 20,
                                        color: kGreenColor),
                                    kWidth5,
                                    Padding(
                                      padding: const EdgeInsets.only(top: 3.0),
                                      child: ItemText(
                                          name:
                                              controller.product![index].price,
                                          weight: FontWeight.normal,
                                          strike: TextDecoration.lineThrough,
                                          fontSize: 18,
                                          color: kBlack54Color),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
