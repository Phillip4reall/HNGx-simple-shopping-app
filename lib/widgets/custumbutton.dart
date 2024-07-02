// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  Custombutton(
      {super.key,
      required this.ontap,
      required this.text,
      required this.height,
      required this.widht});
  void Function()? ontap;
  String text;
  double height;
  double widht;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.lightBlue,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: ontap,
        child: Container(
          width: widht,
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
