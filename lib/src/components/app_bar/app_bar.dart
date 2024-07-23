import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppBarWithBack extends StatelessWidget implements PreferredSizeWidget {
  AppBarWithBack(
      {super.key, required this.title, required this.btnBackClicked});
  final String title;
  Function() btnBackClicked;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.black45,
      leading: IconButton(
          onPressed: btnBackClicked,
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 28,
            color: Colors.black,
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
