import 'package:admin/view/core/color.dart';
import 'package:admin/view/dashboard/screen_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainAppbar extends StatelessWidget {
  const MainAppbar({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Get.offAll(const ScreenDashboard());
          },
          icon: const Icon(Icons.arrow_back)),
      foregroundColor: kBlackColor,
      backgroundColor: kBoxColor,
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
