import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  const ReusableText({super.key, required this.text, required this.textstyle});

  final String text;
  final TextStyle textstyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      textAlign: TextAlign.left,
      softWrap: false,
      overflow: TextOverflow.fade,
      style: textstyle,
    );
  }
}
