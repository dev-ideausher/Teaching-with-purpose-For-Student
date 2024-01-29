import 'package:flutter/material.dart';
import 'package:teaching_with_purpose_student/app/components/commom_richtext.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';



class CustomResultCard extends StatelessWidget {
  final SvgGenImage svg1;
  final String title;
  final String subtitle;
  final String text1;
  final String text2;
  final SvgGenImage svg2;
  final SvgGenImage svg3;
  const CustomResultCard(
      {super.key,
      required this.svg1,
      required this.title,
      required this.subtitle,
      required this.text1,
      required this.text2,
      required this.svg2,
      required this.svg3});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 87.kh,
      width: 343.kw,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            svg1.svg(height: 24.kh, width: 24.kw),
            16.kwidthBox,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600),
                  ),
                  4.kheightBox,
                  Text(
                    subtitle,
                    style: TextStyleUtil.kText14_4(
                        fontWeight: FontWeight.w400,
                        color: context.kLightTextColor),
                  ),
                  4.kheightBox,
                  ReUsableRichText(
                      text1: text1,
                      text2: text2,
                      style1:
                          TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
                      style2: TextStyleUtil.kText14_4(
                          fontWeight: FontWeight.w400,
                          color: context.kLightTextColor)),
                ],
              ),
            ),
            72.kwidthBox,
            svg2.svg(height: 24.kh, width: 24.kw),
            8.kwidthBox,
            svg3.svg(height: 24.kh, width: 24.kw),
          ],
        ),
      ),
    );
  }
}
