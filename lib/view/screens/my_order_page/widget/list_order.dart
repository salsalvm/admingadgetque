import 'package:admin/controller/order_controller.dart';
import 'package:admin/view/constants/color.dart';
import 'package:admin/view/constants/radius.dart';
import 'package:admin/view/constants/space.dart';
import 'package:admin/view/screens/authentication/screen_login.dart';
import 'package:admin/view/screens/widget/item_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderList extends StatelessWidget {
  const OrderList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      init: OrderController(),
      builder: (controller) {
        return controller.allOrder == null
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.teal,
                ),
              )
            : controller.allOrder!.isEmpty
                ? const Center(
                    child: CustomText(
                        name:
                            'No order\nYet find your\nstyle and shop something...',
                        weight: FontWeight.normal,
                        fontSize: 18,
                        color: kGreyColor),
                  )
                : SizedBox(
                    height: size.height,
                    width: size.width,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          List<String> str = controller
                              .allOrder![index].deliveryDetails!.address!
                              .split(',');
                          str = str.reversed.toList();
                          String temp = '';
                          for (var i = 0; i < str.length; i++) {
                            if (i % 2 == 0) {
                              temp = '${str[i]},\n$temp';
                            } else {
                              temp = '${str[i]},$temp';
                            }
                          }

                          return GestureDetector(
                            onTap: () {
                              controller.viewOrderProduct(
                                  '${controller.allOrder![index].id}');
                            },
                            child: Card(
                              shadowColor: kGreyColor,
                              // color: kBoxColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: kRAdius10),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: size.width * .31,
                                      width: size.width * .31,
                                      decoration: BoxDecoration(
                                        borderRadius: kRAdius10,
                                        color: controller
                                                    .allOrder![index].status! ==
                                                'Cancelled'
                                            ? kredColor
                                            : controller.allOrder![index]
                                                        .status! ==
                                                    'Delivered'
                                                ? kGreenColor
                                                : kYellowColor,
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              
                                          children: [
                                            CustomText(
                                                name: controller
                                                    .allOrder![index].userName!
                                                    .toUpperCase(),
                                                weight: FontWeight.bold,
                                                fontSize: 16,
                                                color: kWhiteColor),
                                            kHeigt20,
                                            CustomText(
                                                name: controller
                                                    .allOrder![index].status!
                                                    .toUpperCase(),
                                                weight: FontWeight.bold,
                                                fontSize: 16,
                                                color: kWhiteColor),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CustomText(
                                            name:
                                                'Date ${controller.allOrder![index].date}',
                                            weight: FontWeight.bold,
                                            fontSize: 18,
                                            color: kBlackColor),
                                        CustomText(
                                            name: temp.toUpperCase().trim(),
                                            lines: 2,
                                            weight: FontWeight.w500,
                                            fontSize: 18,
                                            color: kBlack54Color),
                                        CustomText(
                                            name:
                                                'Total :  ${controller.allOrder![index].totalAmount} ',
                                            weight: FontWeight.w500,
                                            fontSize: 20,
                                            color: kGreenColor),
                                        CustomText(
                                            name:
                                                'Method  : ${controller.allOrder![index].paymentMethod}',
                                            weight: FontWeight.bold,
                                            fontSize: 18,
                                            color: kBlack54Color),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: controller.allOrder!.length),
                  );
      },
    );
  }
}
