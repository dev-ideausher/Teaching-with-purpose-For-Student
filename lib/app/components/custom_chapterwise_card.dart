import 'package:flutter/material.dart';
import 'package:teaching_with_purpose_student/app/components/commom_richtext.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';



class CustomChapterWiseCard extends StatelessWidget {
  final String text1;
  final String text2;
  final Widget? widget;
  final String text3;
  final SvgGenImage img;
  const CustomChapterWiseCard(
      {super.key,
      required this.text1,
      required this.text2,
      required this.text3,
      this.widget,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88.kh,
      width: 343.kw,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            img.svg(height: 24.kh,width: 24.kw),
            16.kwidthBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReUsableRichText(
                    text1: text1,
                    text2: text2,
                    style1:TextStyleUtil.kText14_4(fontWeight: FontWeight.w600),
                    style2: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600,color: context.kLightTextColor)),
                // Text(text4!,
                //     style: TextStyleUtil.kText12_4(
                //         fontWeight: FontWeight.w400,
                //         color: context.kLightTextColor)),
                12.kheightBox,
                SizedBox(child: widget),
                12.kheightBox,
                Text(
                  text3,
                  style: TextStyleUtil.kText12_4(fontWeight: FontWeight.w400,color: context.kLightTextColor),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
