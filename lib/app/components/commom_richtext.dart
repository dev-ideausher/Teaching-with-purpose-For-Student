import 'package:flutter/material.dart';

class ReUsableRichText extends StatelessWidget {
  final String text1;
  final String text2;
  final TextStyle style1;
  final TextStyle style2;
  const ReUsableRichText(
      {super.key,
      required this.text1,
      required this.text2 ,
      required this.style1,
      required this.style2});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(text: text1, style: style1,
       children: [
      TextSpan(text: text2, style: style2),
    ]));
  }
}
