import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/common_image_view.dart';
import 'package:teaching_with_purpose_student/app/constants/image_constant.dart';
import 'package:teaching_with_purpose_student/app/constants/string_constants.dart';
import 'package:teaching_with_purpose_student/app/modules/on_board/controllers/on_board_controller.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/custom_button.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';



class GetStartedView extends GetView<OnBoardController> {
  const GetStartedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getStartedWidget(
                img: ImageConstant.getStartedImg,
                title: StringConstants.getStarted,
                subTitle: StringConstants.getStartedText),
            123.kheightBox,
            SizedBox(
              width: 343.kw,
              height: 56.kh,
              child: StButton(
                  title: StringConstants.login,
                  onTap: () => Get.toNamed(Routes.LOGIN)),
            ),
          ],
        ),
      ),
    );
  }

  //custom Widget for img and text

  Widget getStartedWidget(
      {required String img, required String title, required String subTitle}) {
    return Column(
      children: [
        CommonImageView(imagePath: img, height: 300.kh, width: 300.kh),
        38.kheightBox,
        ListTile(
          title: Text(
            textAlign: TextAlign.center,
            title,
            style: TextStyleUtil.kText24_6(fontWeight: FontWeight.w700),
          ),
          subtitle: Text(
            textAlign: TextAlign.center,
            subTitle,
            style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}
