import 'package:admin/view/core/color.dart';
import 'package:admin/view/core/radius.dart';
import 'package:admin/view/core/space.dart';
import 'package:admin/view/authentication/screen_login.dart';
import 'package:admin/view/widget/item_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class CouponList extends StatelessWidget {
  const CouponList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(borderRadius: kRAdius10),
      child: ListView.builder(
        itemBuilder: (context, index) => GestureDetector(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Slidable(endActionPane: ActionPane(
            extentRatio: 1 / 3,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  Get.defaultDialog(
                      backgroundColor: kBoxColor,
                      buttonColor: kButtonColor,
                      middleText: 'Do you Want to Remove',
                      onConfirm: () {},
                      title: 'Are You Sure',
                      onCancel: () {});
                },
                backgroundColor: kredColor,
                foregroundColor: kWhiteColor,
                icon: Icons.delete,
                label: 'Delete',
              ),
              // SlidableAction(
              //   onPressed: (context) {
                 
              //   },
              //   backgroundColor: kYellowColor,
              //   foregroundColor: kBlackColor,
              //   icon: Icons.edit,
              //   label: 'Update',
              // ),
            ],
          ),
              child: Card(
                shadowColor: kGreyColor,
                shape: RoundedRectangleBorder(
                  borderRadius: kRAdius10,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 17,
                        backgroundColor: kBlack54Color,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4.0, bottom: 3),
                          child:
                              ItemText(name: '${index + 1}', color: kWhiteColor),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          ItemText(
                              lines: 2,
                              name: 'FLAT - 50',
                              weight: FontWeight.bold,
                              fontSize: 20,
                              color: kBlackColor),
                          kHeigt5,
                          ItemText(
                              lines: 2,
                              name: 'Start: 28/03/2022',
                              weight: FontWeight.w500,
                              fontSize: 18,
                              color: kBlack54Color),
                        ],
                      ),
                      Container(
                        height: size.width * .16,
                        width: size.width * .2,
                        decoration: BoxDecoration(
                          borderRadius: kRAdius10,
                          color: kYellowColor,
                        ),
                        child: const Center(
                            child: ItemText(fontSize: 25,name: '50%', color: kBlackColor)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        itemCount: 10,
      ),
    );
  }
}
