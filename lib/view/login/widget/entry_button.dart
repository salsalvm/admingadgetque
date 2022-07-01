import 'package:admin/view/core/color.dart';
import 'package:admin/view/core/radius.dart';
import 'package:admin/view/dashboard/screen_dashboard.dart';
import 'package:admin/view/login/screen_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntryButton extends StatelessWidget {
  const EntryButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: kRAdius10,
        ),
        height: size.width * 0.12,
        minWidth: size.width * 0.83,
        color: kFormColor,
        onPressed: () {
          Get.to(const ScreenDashboard());
        },
        child: const Text(
          'Log IN',
          style: TextStyle(color: kWhiteColor, fontSize: 20),
        ),
      ),
    );
  }
}
