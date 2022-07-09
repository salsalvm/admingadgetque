import 'package:admin/view/authentication/screen_login.dart';
import 'package:flutter/material.dart';

class EntryAppbar extends StatelessWidget {
  const EntryAppbar({
    Key? key,
    required this.iconColor,
    required this.textColor,
  }) : super(key: key);
  final Color iconColor;
  final textColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image.network(
        //   'https://cdn-icons.flaticon.com/png/512/471/premium/471936.png?token=exp=1656476534~hmac=4c87b3bd7bb650c2cd222ee34b221360',
        //   color: iconColor,
        //   height: 24,
        //   width: 24,

        // ),
        Container(
          height: size.width * 0.1,
          width: size.width * 0.1,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'asset/logo.png',
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(
            'Gadget Que',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ],
    );
  }
}
