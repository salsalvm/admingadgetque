import 'package:admin/controller/admins_controller.dart';
import 'package:admin/view/constants/color.dart';
import 'package:admin/view/constants/radius.dart';
import 'package:admin/view/constants/space.dart';
import 'package:admin/view/screens/authentication/screen_login.dart';
import 'package:admin/view/screens/widget/item_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class AdminsList extends StatelessWidget {
  const AdminsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      child: GetBuilder<AdminActionController>(
        init: AdminActionController(),
        builder: (controller) => controller.users == null
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.teal,
              ))
            : ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GestureDetector(
                          child: Slidable(
                            endActionPane: ActionPane(
                              extentRatio: 1 / 1.6,
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  autoClose: true,
                                  onPressed: (context) {
                                    Get.defaultDialog(
                                        backgroundColor: kBoxColor,
                                        buttonColor: kButtonColor,
                                        middleText: 'Do you Want to DElete',
                                        onConfirm: () {controller.deleteAdmin(controller
                                              .users![index].id
                                              .toString());
                                          Get.back();},
                                        title: 'Are You Sure',
                                        onCancel: () {});
                                  },
                                  backgroundColor: kredColor,
                                  foregroundColor: kWhiteColor,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                                SlidableAction(
                                  onPressed: (context) {
                                    Get.defaultDialog(
                                        backgroundColor: kBoxColor,
                                        buttonColor: kButtonColor,
                                        middleText: 'Do you Want to Block',
                                        onConfirm: controller.users![index].userBlocked ==
                                          true?(){
                                             controller.unBlockAdmin(controller
                                              .users![index].id
                                              .toString());
                                          Get.back();
                                          }:() {
                                          controller.blockAdmin(controller
                                              .users![index].id
                                              .toString());
                                          Get.back();
                                        },
                                        title: 'Are You Sure',
                                        onCancel: () {});
                                  },
                                  backgroundColor: kYellowColor,
                                  foregroundColor: kBlackColor,
                                  icon: Icons.block,
                                  label: controller.users![index].userBlocked ==
                                          true
                                      ? 'Un Blocked'
                                      : 'Blocked',
                                ),
                              ],
                            ),
                            child: Card(
                              shadowColor: kGreyColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: kRAdius10,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 17,
                                      backgroundColor: kBlack54Color,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 4.0, bottom: 3),
                                        child: CustomText(
                                            name: '${index + 1}',
                                            color: kWhiteColor),
                                      ),
                                    ),
                                    kWidth20,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: size.width * .4,
                                          child: CustomText(
                                              lines: 2,
                                              name:
                                                  '${controller.users![index].name}',
                                              weight: FontWeight.bold,
                                              fontSize: 22,
                                              color: kBlackColor),
                                        ),
                                        // kHeigt5,
                                        CustomText(
                                            name:
                                                '${controller.users![index].emailaddress}',
                                            weight: FontWeight.bold,
                                            fontSize: 20,
                                            color: kBlack54Color),
                                        CustomText(
                                            name:
                                                '+91${controller.users![index].mobile}',
                                            weight: FontWeight.bold,
                                            fontSize: 20,
                                            color: kBlack54Color),
                                        // kHeigt5,
                                      ],
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.person,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                itemCount: controller.users!.length),
      ),
    );
  }
}
