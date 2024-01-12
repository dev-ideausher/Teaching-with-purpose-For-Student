import 'package:flutter/material.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';


class StExamSheet extends StatelessWidget {
  final String title;
  final String examDate;
  final String examTime;
  final String fullMarks;
  final String passingMarks;
  final Color borderColor;
  const StExamSheet(
      {super.key,
      required this.title,
      required this.examDate,
      required this.examTime,
      required this.fullMarks,
      required this.passingMarks,
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
                  Text(examDate,
                      style: TextStyleUtil.kText14_4(
                          fontWeight: FontWeight.w400,
                          color: context.kLightTextColor)),
                  Text(examTime,
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
                  Text(fullMarks,
                      style: TextStyleUtil.kText14_4(
                          fontWeight: FontWeight.w400,
                          color: context.kLightTextColor)),
                  Text(passingMarks,
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
