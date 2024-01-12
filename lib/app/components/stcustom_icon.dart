import 'package:flutter/material.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';


class StIcon extends StatelessWidget {
  final  SvgGenImage svgImg;
  final color;

  const StIcon({super.key, required this.svgImg, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: svgImg.svg(
        height: 24.kh,
        width: 24.kw,
        color: color

      )
    );
  }
}
