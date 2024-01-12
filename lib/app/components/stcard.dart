import 'package:flutter/material.dart';
import 'package:teaching_with_purpose_student/app/components/commom_richtext.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';


class StCard extends StatelessWidget {
  final String title;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String imagePath;

  const StCard({
    super.key,
    required this.title,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4, 
    required this.text5, 
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 184.kh,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title,
                style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500)),
            20.kheightBox,
            Row(
              children: [
                Container(
                    width: 72.kw,
                    height: 93.kh,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage(imagePath), fit: BoxFit.fill))),
                24.kwidthBox,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text1,
                        style: TextStyleUtil.kText14_4(
                            fontWeight: FontWeight.w400,
                            color: context.kLightTextColor),
                      ),
                      8.kheightBox,
                      ReUsableRichText(
                          text1: text2,
                          text2: text3,
                          style1: TextStyleUtil.kText14_4(
                            fontWeight: FontWeight.w400,
                          ),
                          style2: TextStyleUtil.kText14_4(
                              fontWeight: FontWeight.w400,
                              color: context.kLightTextColor)),
                      16.kheightBox,
                      ReUsableRichText(
                          text1: text4,
                          text2: text5,
                          style1: TextStyleUtil.kText14_4(
                            fontWeight: FontWeight.w400,
                          ),
                          style2: TextStyleUtil.kText14_4(
                              fontWeight: FontWeight.w400,
                              color: context.kLightTextColor)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
