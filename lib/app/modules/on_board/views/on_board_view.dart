import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:teaching_with_purpose_student/app/components/common_image_view.dart';
import 'package:teaching_with_purpose_student/app/constants/image_constant.dart';
import 'package:teaching_with_purpose_student/app/constants/string_constants.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/custom_button.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';

import '../controllers/on_board_controller.dart';

class OnBoardView extends GetView<OnBoardController> {
  const OnBoardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 35),
            child:
                skipButton(StringConstants.skip, Get.context!.dotNotActive, () {
              controller.pageCount.value = 2;
              controller.pageController.jumpToPage(controller.pageCount.value);
            }),
          ),
          Expanded(
            child: PageView(
              controller: controller.pageController,
              onPageChanged: (value) => controller.pageCount.value = value,
              children: [
                onboardingWidget(
                    img: ImageConstant.onBoardImageOne,
                    title: StringConstants.onBoardTexttitle1,
                    subTitle: StringConstants.onBoardTextSubtitle2),
                onboardingWidget(
                    img: ImageConstant.onBoardImagetwo,
                    title: StringConstants.onBoardTexttitle1,
                    subTitle: StringConstants.onBoardTextSubtitle2),
                onboardingWidget(
                    img: ImageConstant.onBoardImagethree,
                    title: StringConstants.onBoardTexttitle1,
                    subTitle: StringConstants.onBoardTextSubtitle2),
              ],
            ),
          ),
          78.kheightBox,
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                    controller: controller.pageController,
                    count: 3,
                    effect: ExpandingDotsEffect(
                        activeDotColor: Get.context!.dotActive,
                        dotColor: Get.context!.dotNotActive,
                        dotHeight: 10.kh,
                        spacing: 10.kh,
                        dotWidth: 10.kh,
                        expansionFactor: 1.1),
                    onDotClicked: (index) => controller.onDotClicked(index)),
                SizedBox(
                  width: 113.kw,
                  height: 37.kh,
                  child: StButton(
                      title: StringConstants.next,
                      onTap: () => controller.onTapNext()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }




  onboardingWidget(
      {required String img, required String title, required String subTitle}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonImageView(imagePath: img, height: 300.kh, width: 300.kh),
        43.kheightBox,
        ListTile(
          title: Text(
            textAlign: TextAlign.center,
            title,
            style: TextStyleUtil.kText24_6(fontWeight: FontWeight.w700),
          ),
          subtitle: Text(
            textAlign: TextAlign.center,
            subTitle,
            style: TextStyleUtil.kText16_5(
                fontWeight: FontWeight.w400, color: Get.context!.kBlacklight),
          ),
        )
      ],
    );
  }




  Widget skipButton(String text, Color color, void Function()? onTap) {
    return Container(
      width: 78.kw,
      height: 37.kh,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            text,
            style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
