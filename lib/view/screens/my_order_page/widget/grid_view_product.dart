import 'package:admin/controller/order_controller.dart';
import 'package:admin/view/constants/color.dart';
import 'package:admin/view/constants/radius.dart';
import 'package:admin/view/constants/space.dart';
import 'package:admin/view/screens/authentication/screen_login.dart';
import 'package:admin/view/screens/widget/item_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get_state_manager/get_state_manager.dart';

class ViewProduct extends StatelessWidget {
  const ViewProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<OrderController>(
          init: OrderController(),
          builder: (controller) => controller.products == null
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.teal,
                ))
              : GridView.builder(
                  shrinkWrap: true,
                  // physics: ScrollPhysics(),
                  itemCount: controller.products!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 5,
                    childAspectRatio: 1 / 1.95,
                  ),
                  itemBuilder: (context, index) {
                    final product = controller.products![index];
                    return Card(
                      color: kWhiteColor,
                      shape: RoundedRectangleBorder(borderRadius: kRAdius10),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children: [
                                FadeInImage.assetNetwork(
                                    fit: BoxFit.fill,
                                    width: size.width * .5,
                                    height: size.width * .44,
                                    placeholder: 'asset/noimage.jpeg',
                                    image:
                                        'http://10.0.2.2:3000/product-image/${product.product!.id}/${product.product!.imageId}_1.jpg'),
                              ],
                            ),
                            kHeigt5,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ItemText(
                                    name: '${product.product!.name}'
                                        .toUpperCase(),
                                    weight: FontWeight.w500,
                                    fontSize: 20,
                                    color: kBlackColor),
                                kHeigt5,
                                SizedBox(
                                  child: ItemText(
                                      lines: 2,
                                      name: '${product.product!.description}',
                                      weight: FontWeight.w500,
                                      fontSize: 18,
                                      color: kBlack54Color),
                                ),
                                kHeigt5,
                                ItemText(
                                    name: '${product.product!.category}',
                                    weight: FontWeight.w500,
                                    fontSize: 18,
                                    color: kBlackColor),
                                Row(
                                  children: [
                                    ItemText(
                                        name: '${product.product!.price}',
                                        weight: FontWeight.bold,
                                        fontSize: 22,
                                        color: kGreenColor),
                                    ItemText(
                                        name:
                                            '${product.product!.originalPrice}',
                                        weight: FontWeight.normal,
                                        fontSize: 18,
                                        strike: TextDecoration.lineThrough,
                                        color: kBlack54Color),
                                  ],
                                ),
                                ItemText(
                                    name: 'Qty  :   ${product.quantity} ',
                                    weight: FontWeight.bold,
                                    fontSize: 20,
                                    color: kBlack54Color),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )),
    );
  }
}
