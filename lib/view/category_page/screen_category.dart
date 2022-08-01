import 'package:admin/view/category_page/widget/add_category.dart';
import 'package:admin/view/category_page/widget/category_list.dart';
import 'package:admin/view/core/enum.dart';
import 'package:admin/view/core/space.dart';
import 'package:admin/view/authentication/screen_login.dart';
import 'package:admin/view/widget/action_button.dart';
import 'package:admin/view/widget/main_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenCategory extends StatelessWidget {
  const ScreenCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(55),
            child: MainAppbar(title: 'Category'),
          ),
          body: SafeArea(
            child: ListView(
              children: const [
                kHeigt5,
                CategoryList(),
              ],
            ),
          ),
        ),
        ActionButton(
          buttonWidth: size.width,
          radius: 0,
          buttonHeight: size.width * .13,
          text: 'Add Category',
          onTap: () {
            Get.dialog(
              const AddCategory(
                type: ActionType.isAdding,
              ),
            );
          },
        )
      ],
    );
  }
}
