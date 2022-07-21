import 'package:admin/view/authentication/widget/error_text.dart';
import 'package:admin/controller/login_controller.dart';
import 'package:admin/controller/validation_controller.dart';
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
                    'Hey Chief,\nLogin Now.',
                    style: TextStyle(color: kWhiteColor, fontSize: 28),
                  ),
                  kHeigt150,
                  FormFields(
                      controller: mailController,
                      icon: Icons.mail,
                      validator: (mail) {
                        validController.mailValidation(mail);
                      },
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
                      validator: (password) {
                        validController.passwordValidation(password);
                      },
                      controller: passwordController,
                      icon: Icons.lock,
                      obscureText: true,
                      name: 'Password',
                      size: 20,
                      color: kFormColor,
                      inputTextColor: kWhiteColor),
                  Obx(
                    () => ErrorText(
                        errorText: 'minimum enter 4 letters',
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
                  kHeigt50,
                  Obx(
                    () => Visibility(
                      visible: loginController.isLoading.value,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loginButtonPressed() {
    final mail = mailController.text.trim();
    final password = passwordController.text.trim();
    if (mail.isEmpty || password.isEmpty) {
      Get.snackbar(
          snackPosition: SnackPosition.BOTTOM,
          'fill the field',
          'Every Fields Are Required',
          colorText: kredColor);
      return;
    } else {
      loginController.loginAdmin(mail, password);
    }
  }

  final validController = Get.put(ValidationController());
  final loginController = Get.put(LoginController());
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
}
