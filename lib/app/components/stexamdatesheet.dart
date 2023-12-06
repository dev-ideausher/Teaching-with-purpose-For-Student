import 'package:flutter/material.dart';
import 'package:lwp_for_student/app/services/colors.dart';
import 'package:lwp_for_student/app/services/responsive_size.dart';
import 'package:lwp_for_student/app/services/text_style_util.dart';

class StExamSheet extends StatelessWidget {
  final String title;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final Color borderColor;
  const StExamSheet(
      {super.key,
      required this.title,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.text4,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.kw,
      height: 106.kh,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: borderColor, offset: const Offset(-2, 0))
          ]),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500)),
            16.kheightBox,
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(text1,
                      style: TextStyleUtil.kText14_4(
                          fontWeight: FontWeight.w400,
                          color: context.kLightTextColor)),
                  Text(text2,
                      style: TextStyleUtil.kText14_4(
                          fontWeight: FontWeight.w400,
                          color: context.kLightTextColor)),
                ],
              ),
            ),
            8.kheightBox,
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(text3,
                      style: TextStyleUtil.kText14_4(
                          fontWeight: FontWeight.w400,
                          color: context.kLightTextColor)),
                  Text(text4,
                      style: TextStyleUtil.kText14_4(
                          fontWeight: FontWeight.w400,
                          color: context.kLightTextColor)),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
