import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  const ReusableText({super.key, required this.text, required this.textstyle});

  final String text;
  final TextStyle textstyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: TextAlign.left,
      overflow: TextOverflow.fade,
      style: textstyle,
    );
  }
}
