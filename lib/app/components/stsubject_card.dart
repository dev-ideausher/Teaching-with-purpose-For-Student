import 'package:flutter/material.dart';
import 'package:lwp_for_student/app/services/responsive_size.dart';
import 'package:lwp_for_student/app/services/text_style_util.dart';
import 'package:lwp_for_student/gen/assets.gen.dart';

class MySubjectCard extends StatelessWidget {
  final Widget imageWidget;
  final String text;
  final void Function() onTap;
  const MySubjectCard({super.key, required this.imageWidget, this.text = '', required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        // color: Colors.amber,
        height: 113.kh,
        width: 96.kw,
        child: Column(
          children: [
            AspectRatio(
                aspectRatio: 1.129,
                child: Stack(
                  children: [
                    Center(child: imageWidget),
                    Align(
                     alignment: Alignment.bottomLeft,
                     child: Assets.svg.ellipseLight.svg(),
                    )
                  ],
                )),
            7.kheightBox,
            Text(
              textAlign: TextAlign.center,
              text,
              style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
