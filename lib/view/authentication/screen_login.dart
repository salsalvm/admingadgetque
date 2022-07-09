
import 'package:admin/controller/authentication/error_text.dart';
import 'package:admin/controller/authentication/login_controller.dart';
import 'package:admin/controller/authentication/validation_controller.dart';
import 'package:admin/view/core/color.dart';
import 'package:admin/view/core/radius.dart';
import 'package:admin/view/core/space.dart';
import 'package:admin/view/authentication/widget/background_image.dart';
import 'package:admin/view/authentication/widget/login_appbar.dart';
import 'package:admin/view/widget/form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

late Size size;

class ScreenLogin extends StatelessWidget {
  ScreenLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundImage(
              image: 'asset/admin_background.png',
            ),
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
                      controller: mailController,
                      icon: Icons.mail,
                      name: 'Email',
                      color: kFormColor,
                      inputTextColor: kWhiteColor),
                  Obx(
                    () => ErrorText(
                      errorText: 'enter valid mail',
                      isVisible: validController.email.value,
                    ),
                  ),
                  kHeigt10,
                  FormFields(
                      controller: passwordController,
                      icon: Icons.lock,
                      obscureText: true,
                      name: 'Password',
                      size: 20,
                      color: kFormColor,
                      inputTextColor: kWhiteColor),
                  Obx(
                    () => ErrorText(
                        errorText: 'minimum enter 6 letters',
                        isVisible: validController.pass.value),
                  ),
                  kHeigt10,
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: kRAdius10,
                    ),
                    height: size.width * 0.13,
                    minWidth: size.width,
                    color: kFormColor,
                    onPressed: loginButtonPressed,
                    child: const Text(
                      'Log In',
                      style: TextStyle(color: kWhiteColor, fontSize: 22),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loginButtonPressed() {
    if (mailController.text == 'ameen123@gmail.com' &&
        passwordController.text == 'asdf') {
      loginController.loginAdmin(
        mailController.text.trim(),
        passwordController.text.trim(),
      );
    } else {
      return;
    }
  }

  final validController = Get.put(ValidationController());
  final loginController = Get.put(LoginController());
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
}
