import 'package:admin/view/core/space.dart';
import 'package:admin/view/order_page/widget/order_list.dart';
import 'package:admin/view/widget/main_appbar.dart';
import 'package:flutter/material.dart';

class ScreenOrder extends StatelessWidget {
  const ScreenOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kBoxColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: MainAppbar(title: 'Order'),
      ),
      body: SafeArea(
        child: ListView(
          children: const [
            kHeigt5,
            OrderList(),
          ],
        ),
      ),
    );
  }
}
