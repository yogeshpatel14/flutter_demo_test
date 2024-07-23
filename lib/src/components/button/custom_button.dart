import 'package:flutter/material.dart';
import 'package:test_drive/src/custom_theme/color_list.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String title = '';
  Function()? btnClicked;
  CustomButton({super.key, required this.title, this.btnClicked});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      width: MediaQuery.sizeOf(context).width,
      height: 50,
      child: TextButton(
          onPressed: btnClicked,
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(ThemeColors().primary)),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          )),
    );
  }
}
