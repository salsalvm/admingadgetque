import 'package:admin/view/constants/color.dart';
import 'package:admin/view/screens/my_order_page/widget/grid_view_product.dart';
import 'package:admin/view/screens/widget/item_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenViewOrder extends StatelessWidget {
  const ScreenViewOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const ItemText(name: 'View Product', color: kBlackColor),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: kBlackColor,
              ))),
      body: const SafeArea(
        child: ViewProduct(),
      ),
    );
  }
}
