import 'package:admin/view/core/space.dart';
import 'package:admin/view/coupon_page/widget/add_coupon.dart';
import 'package:admin/view/coupon_page/widget/coupon_list.dart';
import 'package:admin/view/authentication/screen_login.dart';
import 'package:admin/view/widget/action_button.dart';
import 'package:admin/view/widget/main_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ScreenCoupon extends StatelessWidget {
  const ScreenCoupon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(55),
            child: MainAppbar(title: 'Coupon'),
          ),
          body: SafeArea(
            child: ListView(
              children: const [
                kHeigt5,
                CouponList(),
              ],
            ),
          ),
        ),
        ActionButton(
          buttonWidth: size.width,
          radius: 0,
          buttonHeight: size.width * .13,
          text: 'Add New Coupon',
          onTap: () {
            Get.dialog(const AddCoupon());
          },
        )
      ],
    );
  }
}
