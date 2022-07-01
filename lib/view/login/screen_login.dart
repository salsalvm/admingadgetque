import 'package:admin/view/core/color.dart';
import 'package:admin/view/core/space.dart';
import 'package:admin/view/login/widget/background_image.dart';
import 'package:admin/view/login/widget/entry_button.dart';
import 'package:admin/view/login/widget/login_appbar.dart';
import 'package:admin/view/widget/form_field.dart';
import 'package:flutter/material.dart';

late Size size;

class ScreenLogin extends StatelessWidget {
 const ScreenLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundImage(image: 'asset/admin_background.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EntryAppbar(
                    iconColor: kGreyColor,
                    textColor: kWhiteColor,
                  ),
                  kHeigt100,
                  const Text(
                    'Hey Cheife,\nLogin Now.',
                    style: TextStyle(color: kWhiteColor, fontSize: 28),
                  ),
                  kHeigt150,
                  FormFields(
                      name: 'Email',
                      color: kFormColor,
                      inputTextColor: kWhiteColor),
                  FormFields(
                      name: 'Password',
                      color: kFormColor,
                      inputTextColor: kWhiteColor),kHeigt5,
                  const Center(child: EntryButton()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
