import 'package:admin/view/core/space.dart';
import 'package:admin/view/login/screen_login.dart';
import 'package:admin/view/offer_product/widget/add_offer.dart';
import 'package:admin/view/offer_product/widget/product_offer.dart';
import 'package:admin/view/widget/action_button.dart';
import 'package:admin/view/widget/main_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ScreenOfferProduct extends StatelessWidget {
  const ScreenOfferProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(55),
            child: MainAppbar(title: 'Offer Product'),
          ),
          body: SafeArea(
            child: ListView(
              children: const [
                kHeigt5,
                OfferProductList(),
              ],
            ),
          ),
        ),
        ActionButton(
          buttonWidth: size.width,
          radius: 0,
          buttonHeight: size.width * .13,
          text: 'Add Offer Product',
          onTap: () {
            Get.dialog(const AddOffer());
          },
        )
      ],
    );
  }
}
