
import 'package:admin/view/core/color.dart';
import 'package:admin/view/core/space.dart';
import 'package:admin/view/dashboard/widget/dashboard_log.dart';
import 'package:admin/view/dashboard/widget/graph_schedule.dart';
import 'package:admin/view/widget/drawer/drawer.dart';
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
              children: const [
                DashboardLog(),
                kHeigt30,
                GraphScheduled(
                  title: 'Weekly Sales',
                ),
                kHeigt20,
                GraphScheduled(title: 'Montly Sales'),
                kHeigt20,
                GraphScheduled(title: 'Yearly Sales')
              ],
            ),
          ),
        ),
        drawer: DrawerList());
  }
}
