import 'package:admin/view/constants/color.dart';
import 'package:admin/view/constants/radius.dart';
import 'package:admin/view/constants/space.dart';
import 'package:admin/view/screens/authentication/screen_login.dart';
import 'package:admin/view/screens/widget/item_text.dart';
import 'package:flutter/material.dart';

class DashboardLog extends StatelessWidget {
  const DashboardLog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
            children: const [
              ItemText(name: 'Total User', color: kWhiteColor),
              kHeigt10,
              ItemText(
                name: '1',
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
            children: const [
              ItemText(
                  name: 'Today’s Collection', color: kWhiteColor),
              kHeigt10,
              ItemText(
                name: '€14,000',
                color: kWhiteColor,
                fontSize: 25,
              )
            ],
          ),
        ),
      ],
    );
  }
}
