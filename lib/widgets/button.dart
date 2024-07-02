import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/text_font.dart';

class Button extends StatelessWidget {
  final String text;
  final Function()? tap;
  const Button({
    required this.tap,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 150,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: TextButton(
        onPressed: tap,
        child: Text(
          text,
          style: textfont(Colors.blue, 18, FontWeight.normal),
        ),
      ),
    );
  }
}
