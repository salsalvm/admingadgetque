import 'package:admin/services/dashboard_services.dart';
import 'package:admin/view/constants/color.dart';
import 'package:admin/view/constants/space.dart';
import 'package:admin/view/screens/authentication/screen_login.dart';
import 'package:admin/view/screens/dashboard_page/widget/dashboard_log.dart';
import 'package:admin/view/screens/dashboard_page/widget/graph_schedule.dart';
import 'package:admin/view/screens/dashboard_page/widget/top_sellers.dart';
import 'package:admin/view/screens/widget/divider.dart';
import 'package:admin/view/screens/widget/drawer/drawer.dart';
import 'package:admin/view/screens/widget/item_text.dart';
import 'package:flutter/material.dart';

class ScreenDashboard extends StatelessWidget {
  const ScreenDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: kBlackColor,
          backgroundColor: kBoxColor,
          centerTitle: true,
          title: const Text(
            "Dashboard",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: kBlackColor,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: ListView(
              children: [
                const DashboardLog(),
                kHeigt20,
                CustomText(
                  name: 'Top 5 Seller'.toUpperCase(),
                  color: kBlackColor,
                  fontSize: 25,
                ),
                const DivLine(),
               const TopSellers()
                // GraphScheduled(
                //   title: 'Weekly Sales',
                // ),
                // kHeigt20,
                // GraphScheduled(title: 'Montly Sales'),
                // kHeigt20,
                // GraphScheduled(title: 'Yearly Sales')
              ],
            ),
          ),
        ),
        drawer: DrawerList());
  }
}
