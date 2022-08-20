import 'package:admin/view/constants/space.dart';
import 'package:admin/view/screens/my_order_page/widget/list_order.dart';
import 'package:admin/view/screens/widget/main_appbar.dart';
import 'package:flutter/material.dart';

class ScreenOrder extends StatelessWidget {
  const ScreenOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: MainAppbar(title: 'Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SafeArea(
          child: ListView(
            children:  [OrderList(), kHeigt20],
          ),
        ),
      ),
    );
  }
}
