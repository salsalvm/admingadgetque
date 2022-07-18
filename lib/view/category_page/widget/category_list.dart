import 'package:admin/view/core/color.dart';
import 'package:admin/view/core/radius.dart';
import 'package:admin/view/authentication/screen_login.dart';
import 'package:admin/view/widget/item_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
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
        
          child: Slidable(
            endActionPane: ActionPane(
              extentRatio: 1 / 2,
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
                SlidableAction(
                  onPressed: (context) {},
                  backgroundColor: kYellowColor,
                  foregroundColor: kBlackColor,
                  icon: Icons.edit,
                  label: 'Update',
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: kRAdius10,
                ),
                shadowColor: kGreyColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 17,
                        backgroundColor: kBlack54Color,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4.0, bottom: 3),
                          child: ItemText(
                              name: '${index + 1}', color: kWhiteColor),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: size.width * .435,
                            child: const ItemText(
                                name: 'Mobile',
                                weight: FontWeight.bold,
                                fontSize: 22,
                                color: kBlackColor),
                          ),
                        ],
                      ),
                      Container(
                        height: size.width * .18,
                        width: size.width * .2,
                        decoration: BoxDecoration(
                          borderRadius: kRAdius10,
                          color: kWhiteColor,
                          image: const DecorationImage(
                            image: AssetImage(
                              'asset/mobile.png',
                            ),
                          ),
                        ),
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
