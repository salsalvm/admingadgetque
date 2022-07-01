import 'package:admin/view/admin/screen_admin.dart';
import 'package:admin/view/core/color.dart';
import 'package:admin/view/core/space.dart';
import 'package:admin/view/dashboard/screen_dashboard.dart';
import 'package:admin/view/login/widget/login_appbar.dart';
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
          Get.to(
            const ScreenDashboard(),
          );
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
        title: 'All Product',
        onTap: () {},
      ),
      MyTile(
        icon: Icons.category_outlined,
        title: 'All Category',
        onTap: () {},
      ),
      MyTile(
        icon: Icons.local_shipping,
        title: 'All Order',
        onTap: () {},
      ),
      MyTile(
        icon: Icons.free_cancellation,
        title: 'Product Offer',
        onTap: () {},
      ),
      MyTile(
        icon: Icons.local_offer_sharp,
        title: 'Catogory Offer',
        onTap: () {},
      ),
      MyTile(
        icon: Icons.star,
        title: 'Coupon',
        onTap: () {},
      ),
      MyTile(
        icon: Icons.report,
        title: 'Report',
        onTap: () {},
      ),
    ],
  );
}
