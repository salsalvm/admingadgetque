import 'package:admin/view/core/space.dart';
import 'package:admin/view/authentication/screen_login.dart';
import 'package:admin/view/product/widget/add_product.dart';
import 'package:admin/view/product/widget/product_grid.dart';
import 'package:admin/view/widget/action_button.dart';
import 'package:admin/view/widget/main_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenProduct extends StatelessWidget {
  const ScreenProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Scaffold(
          // backgroundColor: kBoxColor,
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(55),
            child: MainAppbar(title: 'Product'),
          ),
          body: SafeArea(
            child: ListView(
              children: const [
                kHeigt5,
                ProductGrid(),
              ],
            ),
          ),
        ),
        ActionButton(
          buttonWidth: size.width,
          radius: 0,
          buttonHeight: size.width * .13,
          text: 'Add Product',
          onTap: () {
            Get.dialog(
              const AddProduct(),
            );
          },
        )
      ],
    );
  }
}
