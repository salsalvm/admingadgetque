import 'package:admin/view/core/color.dart';
import 'package:admin/view/core/radius.dart';
import 'package:admin/view/core/space.dart';
import 'package:admin/view/login/screen_login.dart';
import 'package:admin/view/widget/item_text.dart';
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
      child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) => SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  
                    child: GestureDetector(child: Slidable(
                    endActionPane: ActionPane(
                      extentRatio: 1 / 2,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          autoClose: true,
                          onPressed: (context) {
                            Get.defaultDialog(
                                backgroundColor: kBoxColor,
                                buttonColor: kButtonColor,
                                middleText: 'Do you Want to DElete',
                                onConfirm: () {},
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
                                onConfirm: () {},
                                title: 'Are You Sure',
                                onCancel: () {});
                          },
                          backgroundColor: kYellowColor,
                          foregroundColor: kBlackColor,
                          icon: Icons.block,
                          label: 'Block',
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
                                  child: ItemText(
                                      name: '${index + 1}', color: kWhiteColor),
                                ),
                              ),
                              kWidth20,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: size.width * .4,
                                    child: const ItemText(
                                        lines: 2,
                                        name: 'Ameen',
                                        weight: FontWeight.bold,
                                        fontSize: 22,
                                        color: kBlackColor),
                                  ),
                                  // kHeigt5,
                                  const ItemText(
                                      name: 'ameen123@gmail.com',
                                      weight: FontWeight.bold,
                                      fontSize: 20,
                                      color: kBlack54Color),
                                  const ItemText(
                                      name: '+91 7558959094',
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
          itemCount: 4),
    );
  }
}
