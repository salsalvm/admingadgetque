import 'package:admin/view/admin/screen_admin.dart';
import 'package:admin/view/category/screen_category.dart';
import 'package:admin/view/core/color.dart';
import 'package:admin/view/core/space.dart';
import 'package:admin/view/coupon/screen_coupon.dart';
import 'package:admin/view/login/screen_login.dart';
import 'package:admin/view/login/widget/login_appbar.dart';
import 'package:admin/view/offer_product/screen_offer_product.dart';
import 'package:admin/view/order/screen_order.dart';
import 'package:admin/view/product/screen_product.dart';
import 'package:admin/view/report/screen_report.dart';
import 'package:admin/view/widget/action_button.dart';
import 'package:admin/view/widget/my_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Column drawerLists() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          EntryAppbar(iconColor: kWhiteColor, textColor: kWhiteColor),
          kHeigt80
        ],
      ),
      MyTile(
        icon: Icons.dashboard,
        title: 'Dashboard',
        onTap: () {
          Get.back();
        },
      ),
      MyTile(
          icon: Icons.admin_panel_settings_outlined,
          title: 'Admin',
          onTap: () {
            Get.to(
              const ScreenAdmin(),
            );
          }),
      MyTile(
        icon: Icons.production_quantity_limits_sharp,
        title: 'Product',
        onTap: () {
          Get.to(const ScreenProduct());
        },
      ),
      MyTile(
        icon: Icons.category_outlined,
        title: 'Category',
        onTap: () {
          Get.to(const ScreenCategory());
        },
      ),
      MyTile(
        icon: Icons.local_shipping,
        title: 'Order',
        onTap: () {
          Get.to(const ScreenOrder());
        },
      ),
      MyTile(
        icon: Icons.free_cancellation,
        title: 'Product Offer',
        onTap: () {
          Get.to(const ScreenOfferProduct());
        },
      ),
      MyTile(
        icon: Icons.local_offer_sharp,
        title: 'Coupon',
        onTap: () {
          Get.to(const ScreenCoupon());
        },
      ),
      // MyTile(
      //   icon: Icons.star,
      //   title: 'Coupon',
      //   onTap: () {
      //     Get.to(const ScreenCoupon());
      //   },
      // ),
      MyTile(
        icon: Icons.report,
        title: 'Report',
        onTap: () {
          Get.to(const ScreenReport());
        },
      ),
      const Spacer(),
      ActionButton(
          buttonWidth: size.width,
          buttonHeight: size.width * .13,
          text: 'Log Out',
          radius: 0,
          buttonColor: kFormColor,
          onTap: () {
            Get.defaultDialog(
                backgroundColor: kBoxColor,
                buttonColor: kButtonColor,
                middleText: 'Do you Want to log out',
                onConfirm: () {},
                title: 'Are You Sure',
                onCancel: () {});
          })
    ],
  );
}
