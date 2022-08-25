import 'package:admin/controller/dashboard_controller.dart';
import 'package:admin/view/constants/color.dart';
import 'package:admin/view/constants/radius.dart';
import 'package:admin/view/constants/space.dart';
import 'package:admin/view/screens/authentication/screen_login.dart';
import 'package:admin/view/screens/widget/item_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DashboardLog extends StatelessWidget {
  const DashboardLog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) =>
      //  controller == null
      //     ? 
          // const Center(
          //     child: CircularProgressIndicator(
          //       color: Colors.teal,
          //     ),
          //   )
          // :
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: size.width * .24,
                  width: size.width * .45,
                  decoration: BoxDecoration(
                    borderRadius: kRAdius10,
                    color: kGreenColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(name: 'Total User', color: kWhiteColor),
                      kHeigt10,
                      CustomText(
                        name: '${controller.user}',
                        color: kWhiteColor,
                        fontSize: 25,
                      )
                    ],
                  ),
                ),
                Container(
                  height: size.width * .24,
                  width: size.width * .45,
                  decoration: BoxDecoration(
                    borderRadius: kRAdius10,
                    color: Colors.orange,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                     const CustomText(
                          name: 'Today’s Collection', color: kWhiteColor),
                      kHeigt10,
                      CustomText(
                        name: '${controller.todayCollection}',
                        color: kWhiteColor,
                        fontSize: 25,
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
