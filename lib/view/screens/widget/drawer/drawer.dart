import 'package:admin/controller/login_controller.dart';
import 'package:admin/view/constants/color.dart';
import 'package:admin/view/constants/space.dart';
import 'package:admin/view/screens/admin_page/screen_admin.dart';
import 'package:admin/view/screens/authentication/screen_login.dart';
import 'package:admin/view/screens/authentication/widget/login_appbar.dart';
import 'package:admin/view/screens/category_page/screen_category.dart';
import 'package:admin/view/screens/my_order_page/screen_all_order.dart';
import 'package:admin/view/screens/product_page/screen_product.dart';
import 'package:admin/view/screens/widget/action_button.dart';
import 'package:admin/view/screens/widget/my_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerList extends StatelessWidget {
  final loginController = Get.put(LoginController());
  DrawerList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kBlackColor,
      child: Column(
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
          // MyTile(
          //   icon: Icons.free_cancellation,
          //   title: 'Product Offer',
          //   onTap: () {
          //     Get.to(const ScreenOfferProduct());
          //   },
          // ),
          // MyTile(
          //   icon: Icons.local_offer_sharp,
          //   title: 'Coupon',
          //   onTap: () {
          //     Get.to(const ScreenCoupon());
          //   },
          // ),
          // MyTile(
          //   icon: Icons.report,
          //   title: 'Report',
          //   onTap: () {
          //     Get.to(const ScreenReport());
          //   },
          // ),
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
                    onConfirm: () {
                      loginController.logoutAdmin();
                    },
                    title: 'Are You Sure',
                    onCancel: () {});
              })
        ],
      ),
    );
  }
}
