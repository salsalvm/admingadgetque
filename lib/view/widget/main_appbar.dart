import 'package:admin/view/core/color.dart';
import 'package:admin/view/dashboard_page/screen_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainAppbar extends StatelessWidget {
  const MainAppbar({Key? key, required this.title, this.color = kBoxColor})
      : super(key: key);
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Get.offAll(const ScreenDashboard());
          },
          icon: const Icon(Icons.arrow_back)),
      foregroundColor: kBlackColor,
      backgroundColor: color,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: kBlackColor,
        ),
      ),
    );
  }
}
