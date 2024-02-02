import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/constants/string_constants.dart';
import 'package:teaching_with_purpose_student/app/modules/on_board/controllers/on_board_controller.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/custom_button.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';



class GetStartedView extends GetView<OnBoardController> {
  const GetStartedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 142, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getStartedWidget(
                img: Assets.svg.screen5Combined,
                title: StringConstants.getStarted,
                subTitle: StringConstants.getStartedText),
            123.kheightBox,
            StButton(
                title: StringConstants.login,
                onTap: () => Get.toNamed(Routes.LOGIN)),
          ],
        ),
      ),
    );
  }

  //custom Widget for img and text

  Widget getStartedWidget(
  {required SvgGenImage img, required String title, required String subTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        img.svg(height: 300.kh,width: 300.kw),
        38.kheightBox,
        Text(
          title,
          style: TextStyleUtil.kText24_6(fontWeight: FontWeight.w700),
        ),
        16.kheightBox,
        Text(
          subTitle,
          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
