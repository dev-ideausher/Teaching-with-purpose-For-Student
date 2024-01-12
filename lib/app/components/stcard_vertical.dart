
import 'package:flutter/material.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';


class StCardVertical extends StatelessWidget {
  final String title;
  final String text1;
  final String text2;
  final String imagePath;
  final Color borderColor;

  const StCardVertical({
    super.key,
    required this.title,
    required this.text1,
    required this.text2,
    required this.imagePath,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 308.kw,
      height: 156.kh,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow:  [
          BoxShadow(
           color: context.kLightred, 
           offset: const Offset(-2, 0)
          )
        ]
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500)),
            12.kheightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 88.kw,
                    height: 88.kh,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage(imagePath), fit: BoxFit.fill))),
                16.kwidthBox,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Assets.icons.clock.image(),
                          8.kwidthBox,
                          Text(
                            text1,
                            maxLines: 2,
                            style: TextStyleUtil.kText14_4(
                                fontWeight: FontWeight.w500,
                                color: context.kLightTextColor),
                          ),
                        ],
                      ),
                      8.kheightBox,
                      Text(
                        text2,
                        maxLines: 2,
                        style:TextStyleUtil.kText12_4(
                                fontWeight: FontWeight.w400,
                                color: context.kLightTextColor),
                      ),
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
