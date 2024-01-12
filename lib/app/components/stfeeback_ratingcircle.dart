import 'package:flutter/material.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';


class FeedbackratingCircle extends StatelessWidget {
  final String text;
  final void Function() onTap;
   const FeedbackratingCircle({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40.kh,
        width: 40.kw,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.kWhite,
            border: Border.all(color: context.kPrimary, width: 1)),
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            text,
            style: TextStyleUtil.kText18_6(
                fontWeight: FontWeight.w500, color: context.kPrimary),
          ),
        ),
      ),
    );
  }
}
