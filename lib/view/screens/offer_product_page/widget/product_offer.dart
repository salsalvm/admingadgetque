import 'package:admin/view/constants/color.dart';
import 'package:admin/view/constants/radius.dart';
import 'package:admin/view/constants/space.dart';
import 'package:admin/view/screens/authentication/screen_login.dart';
import 'package:admin/view/screens/widget/item_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class OfferProductList extends StatelessWidget {
  const OfferProductList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(borderRadius: kRAdius10),
        child: ListView.builder(
          itemBuilder: (context, index) => GestureDetector(
            child: Slidable(endActionPane: ActionPane(
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
                onPressed: (context) {
                 
                },
                backgroundColor: kYellowColor,
                foregroundColor: kBlackColor,
                icon: Icons.edit,
                label: 'Update',
              ),
            ],
          ),
              child: Card(
                color: kWhiteColor,
                shadowColor: kGreyColor,
                shape: RoundedRectangleBorder(borderRadius: kRAdius10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ItemText(
                              name: 'Smart Watch',
                              weight: FontWeight.bold,
                              fontSize: 22,
                              color: kBlackColor),
                          kHeigt5,
                          SizedBox(
                            width: size.width * .435,
                            child: const ItemText(
                                lines: 2,
                                name: 'Smart Watch Apple Dual core',
                                weight: FontWeight.w500,
                                fontSize: 18,
                                color: kBlack54Color),
                          ),
                          kHeigt5,
                          Row(
                            children: const [
                              ItemText(
                                  name: '€14,000',
                                  weight: FontWeight.bold,
                                  fontSize: 22,
                                  color: kBlackColor),
                              kWidth5,
                              ItemText(
                                  name: '€14,000',
                                  weight: FontWeight.normal,
                                  strike: TextDecoration.lineThrough,
                                  fontSize: 20,
                                  color: kBlack54Color),
                            ],
                          ),
                          kHeigt5,
                          Container(
                            padding: const EdgeInsets.only(left: 5),
                            height: size.width * .08,
                            width: size.width * .4,
                            decoration: BoxDecoration(
                              borderRadius: kRAdius10,
                              color: kWhiteColor,
                            ),
                            child: ItemText(
                                name: '50% off',
                                color: kGreenColor,
                                fontSize: 26,),
                          )
                        ],
                      ),
                      Container(
                        height: size.width * .4,
                        width: size.width * .435,
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
          itemCount: 10,
        ),
      ),
    );
  }
}
