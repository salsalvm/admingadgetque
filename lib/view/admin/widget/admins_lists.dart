
import 'package:admin/view/core/color.dart';
import 'package:admin/view/core/radius.dart';
import 'package:admin/view/core/space.dart';
import 'package:admin/view/login/screen_login.dart';
import 'package:admin/view/widget/item_text.dart';
import 'package:flutter/material.dart';

class AdminsList extends StatelessWidget {
  const AdminsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => SizedBox(
                child: ListTile(
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: kRAdius10,
                  ),
                  title:
                      const ItemText(name: 'Ameen', color: kBlackColor),
                  subtitle: const ItemText(
                      name: 'ameen@gmail.com', color: kBlack54Color),
                  tileColor: kFormColor,
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: CircleAvatar(
                      radius: 17,
                      backgroundColor: kBlack54Color,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 4.0, bottom: 3),
                        child: ItemText(
                            name: '${index + 1}', color: kWhiteColor),
                      ),
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_circle_right),
                ),
              ),
          separatorBuilder: (context, index) => kHeigt10,
          itemCount: 4),
    );
  }
}
