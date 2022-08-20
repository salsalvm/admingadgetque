import 'package:admin/view/constants/enum.dart';
import 'package:admin/view/constants/space.dart';
import 'package:admin/view/screens/authentication/screen_login.dart';
import 'package:admin/view/screens/product_page/widget/add_product.dart';
import 'package:admin/view/screens/product_page/widget/grid_product.dart';
import 'package:admin/view/screens/widget/action_button.dart';
import 'package:admin/view/screens/widget/main_appbar.dart';
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
            const  AddProduct(type: ActionType.isAdding),
            );
          },
        )
      ],
    );
  }
}
