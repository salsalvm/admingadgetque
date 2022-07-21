import 'package:admin/controller/product_controller.dart';
import 'package:admin/view/core/color.dart';
import 'package:admin/view/core/radius.dart';
import 'package:admin/view/core/space.dart';
import 'package:admin/view/authentication/screen_login.dart';
import 'package:admin/view/core/url.dart';
import 'package:admin/view/widget/item_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * .838,
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
                  return Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Card(
                          color: kWhiteColor,
                          shape:
                              RoundedRectangleBorder(borderRadius: kRAdius10),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  imageUrl:
                                      '$kImageBaseUrl/product-image/${controller.product![index].id}/${controller.product![index].imageId}_1.jpg',
                                  width: size.width * .5,
                                  height: size.width * .5,
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, str, error) =>
                                      CachedNetworkImage(
                                    imageUrl:
                                        'http://34.227.15.1/product-image/${controller.product![index].id}/${controller.product![index].imageId}_1.jpg',
                                    width: size.width * .5,
                                    height: size.width * .5,
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
                                kHeigt5,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ItemText(
                                        name: controller.product![index].name!
                                            .toUpperCase(),
                                        weight: FontWeight.bold,
                                        fontSize: 18,
                                        color: kBlackColor),
                                    SizedBox(
                                      child: ItemText(
                                          lines: 2,
                                          name: controller
                                              .product![index].description!,
                                          weight: FontWeight.w400,
                                          fontSize: 16,
                                          color: kBlack54Color),
                                    ),
                                    // kHeigt5,
                                    ItemText(
                                        name: controller
                                            .product![index].category!,
                                        weight: FontWeight.w500,
                                        fontSize: 18,
                                        color: kBlackColor),
                                    Row(
                                      children: [
                                        ItemText(
                                            name: controller
                                                .product![index].originalPrice!,
                                            weight: FontWeight.bold,
                                            fontSize: 20,
                                            color: kGreenColor),
                                        kWidth5,
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3.0),
                                          child: ItemText(
                                              name: controller
                                                  .product![index].price!,
                                              weight: FontWeight.normal,
                                              strike:
                                                  TextDecoration.lineThrough,
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
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: kGreyColor,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  Get.defaultDialog(
                                      backgroundColor: kBoxColor,
                                      buttonColor: kButtonColor,
                                      middleText: 'confirm your action',
                                      onConfirm: () {
                                        controller.deleteProduct(
                                            controller.product![index].id);
                                        Get.back();
                                      },
                                      title: 'delete product',
                                      onCancel: () {});
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: kredColor,
                                ))
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
