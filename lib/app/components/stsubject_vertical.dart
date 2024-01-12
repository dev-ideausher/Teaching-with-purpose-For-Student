import 'package:flutter/material.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';


class StSubjectVertical extends StatelessWidget {
  final SvgGenImage svgImage;
  final String text;
  final Color color;
  const StSubjectVertical(
      {super.key, required this.svgImage, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 101.kh,
      width: 88.kw,
      child: Column(
        children: [
          Container(
            height: 72.kh,
            width: 72.kw,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1,color: color),
                image: DecorationImage(
                    image: Assets.images.boxEffect.image().image,
                    fit: BoxFit.cover)),
            child: Center(
              child: svgImage.svg(),
            ),
          ),
          8.kheightBox,
          Text(
            textAlign: TextAlign.center,
            text,
            style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
