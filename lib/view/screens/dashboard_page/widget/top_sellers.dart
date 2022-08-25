import 'package:admin/controller/dashboard_controller.dart';
import 'package:admin/view/constants/color.dart';
import 'package:admin/view/screens/authentication/screen_login.dart';
import 'package:admin/view/screens/widget/item_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TopSellers extends StatelessWidget {
  const TopSellers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      width: size.width,
      child: GetBuilder<DashboardController>(
        init: DashboardController(),
        builder: (controller) => controller.topSellings == null
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.teal,
                ),
              )
            : ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: kWhiteColor,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: kGreyColor,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: CustomText(
                            name: '${index + 1}', color: kBlackColor),
                      ),
                    ),
                    title: CustomText(
                        name: controller.topSellings![index].id.toUpperCase(),
                        color: kBlackColor,
                        fontSize: 18,
                        weight: FontWeight.bold),
                    trailing: CircleAvatar(
                      backgroundColor: kGreyColor,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: CustomText(
                            name: '${controller.topSellings![index].totalQty}',
                            color: kBlackColor),
                      ),
                    ),
                  ),
                ),
                itemCount: 5,
              ),
      ),
    );
  }
}
