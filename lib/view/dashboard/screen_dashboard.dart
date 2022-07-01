import 'dart:io';

import 'package:admin/view/core/color.dart';
import 'package:admin/view/core/radius.dart';
import 'package:admin/view/core/space.dart';
import 'package:admin/view/dashboard/widget/dashboard_log.dart';
import 'package:admin/view/dashboard/widget/graph_schedule.dart';
import 'package:admin/view/login/screen_login.dart';
import 'package:admin/view/widget/divider.dart';
import 'package:admin/view/widget/drawer/functions.dart';
import 'package:admin/view/widget/item_text.dart';
import 'package:admin/view/login/widget/login_appbar.dart';
import 'package:admin/view/widget/main_appbar.dart';
import 'package:flutter/material.dart';

class ScreenDashboard extends StatelessWidget {
  const ScreenDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: MainAppbar(title: 'Dashboard'),
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
        drawer: Drawer(
          backgroundColor: kBlackColor,
          child: drawerLists(),
        ));
  }
}
