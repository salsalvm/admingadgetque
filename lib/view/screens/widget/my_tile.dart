
import 'package:admin/view/constants/color.dart';
import 'package:admin/view/constants/space.dart';
import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  MyTile({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.title,
  }) : super(key: key);
  final IconData icon;
  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          tileColor: Colors.black.withOpacity(.08),
          leading: CircleAvatar(
            radius: 18,
            backgroundColor: kFormColor,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          onTap: onTap,
          title: Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
          trailing: const Icon(
            Icons.arrow_right,
            color: Colors.white,
          ),
        ),
        kHeigt5
      ],
    );
  }
}
