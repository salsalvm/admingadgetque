import 'package:admin/view/constants/color.dart';
import 'package:admin/view/screens/authentication/screen_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const SuperAdmin());
}

class SuperAdmin extends StatelessWidget {
  const SuperAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenLogin(),
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: kWhiteColor,
          ),
        ));
  }
}
