import 'package:admin/view/admin/widget/admins_lists.dart';
import 'package:admin/view/core/color.dart';
import 'package:admin/view/core/radius.dart';
import 'package:admin/view/core/space.dart';
import 'package:admin/view/login/screen_login.dart';
import 'package:admin/view/widget/item_text.dart';
import 'package:admin/view/widget/main_appbar.dart';
import 'package:flutter/material.dart';

class ScreenAdmin extends StatelessWidget {
  const ScreenAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kBoxColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: MainAppbar(title: 'Admin'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          children: const [AdminsList()],
        ),
      )),
    );
  }
}
