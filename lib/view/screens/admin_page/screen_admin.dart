import 'package:admin/view/constants/color.dart';
import 'package:admin/view/constants/space.dart';
import 'package:admin/view/screens/admin_page/widget/admins_lists.dart';
import 'package:admin/view/screens/widget/main_appbar.dart';
import 'package:flutter/material.dart';

class ScreenAdmin extends StatelessWidget {
  const ScreenAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: MainAppbar(title: 'Admin'),
      ),
      body: SafeArea(
        child: ListView(
          children: const [
            kHeigt5,
            AdminsList(),
          ],
        ),
      ),
    );
  }
}
