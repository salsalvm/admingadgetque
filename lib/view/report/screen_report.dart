import 'package:admin/view/core/color.dart';
import 'package:admin/view/core/space.dart';
import 'package:admin/view/login/screen_login.dart';
import 'package:admin/view/report/widget/graph_report.dart';
import 'package:admin/view/widget/divider.dart';
import 'package:admin/view/widget/item_text.dart';
import 'package:admin/view/widget/main_appbar.dart';
import 'package:flutter/material.dart';

class ScreenReport extends StatelessWidget {
  const ScreenReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: MainAppbar(title: 'Report'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            kHeigt20,
            const Center(
              child: ItemText(
                  name: 'Sales Report On ',
                  color: kBlack54Color,
                  fontSize: 25,
                  weight: FontWeight.bold),
            ),
            kHeigt20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ItemText(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2021, 01),
                      lastDate: DateTime(2022, 12),
                    ).then((pickedDate) {
                      DateTime.june;
                    });
                  },
                  name: '22/04/2022',
                  color: kBlackColor,
                  fontSize: 24,
                ),
                const ItemText(name: '   - to -   ', color: kBlackColor),
                ItemText(
                    name: '29/04/2022',
                    color: kBlackColor,
                    fontSize: 24,
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2021, 1),
                        lastDate: DateTime(2022, 12),
                      ).then((pickedDate) {
                        DateTime.june;
                      });
                    }),
              ],
            ),
            const DivLine(),
            kHeigt10,
            ReportLog(
                fColor: kWhiteColor,
                fText: 'TOTAL SALES',
                boxColor: kGreen,
                sText: '€1,04,000',
                sColor: kWhiteColor,
                height: size.width * .2),
            Container(
              width: size.width,
              height: size.width * .6,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'asset/graph.png',
                    ),
                    filterQuality: FilterQuality.high),
              ),
            ),
            ReportLog(
                fText: 'Total Order', sText: '39', height: size.width * .19),
            ReportLog(
                fText: 'Order Confirmed',
                sText: '20',
                sColor: kGreen,
                height: size.width * .19),
            ReportLog(
                fText: 'Order Canceled',
                sText: '19',
                sColor: kredColor,
                height: size.width * .19),
            kHeigt10,
          ],
        ),
      ),
    );
  }
}
