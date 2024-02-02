import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:teaching_with_purpose_student/app/constants/string_constants.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/custom_button.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';

import '../controllers/on_board_controller.dart';

class OnBoardView extends GetView<OnBoardController> {
  const OnBoardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(265, 68, 16, 0),
          child: skipButton(
          StringConstants.skip, 
          Get.context!.dotNotActive,
           () {
            controller.pageCount.value = 2;
            controller.pageController.jumpToPage(controller.pageCount.value);
          }),
        ),
        32.kheightBox,
          Expanded(
            child: PageView(
              controller: controller.pageController,
              onPageChanged: (value) => controller.pageCount.value = value,
              children: [
                onboardingWidget(
                    img: Assets.svg.screen2Combined,
                    title: StringConstants.onBoardTexttitle1,
                    subTitle: StringConstants.onBoardTextSubtitle2),
                onboardingWidget(
                    img: Assets.svg.screen3Combined,
                    title: StringConstants.onBoardTexttitle2,
                    subTitle: StringConstants.onBoardTextSubtitle2),
                onboardingWidget(
                    img: Assets.svg.screen4Combined,
                    title: StringConstants.onBoardTexttitle3,
                    subTitle: StringConstants.onBoardTextSubtitle2),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(35, 78, 35, 33),
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
                        expansionFactor: 1.1
                    ),
                    onDotClicked: (index) => controller.onDotClicked(index)),
                // 140.kwidthBox,
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
  {required SvgGenImage img, required String title, required String subTitle}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        img.svg(height: 300.kh, width: 300.kw),
        43.kheightBox,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 38),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyleUtil.kText24_6(fontWeight: FontWeight.w700),
          ),
        ),
        16.kheightBox,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            maxLines: 3,
            style: TextStyleUtil.kText16_5(
                fontWeight: FontWeight.w400, color: Get.context!.kBlacklight),
          ),
        ),
      ],
    );
  }




  Widget skipButton(String text, Color color, void Function()? onTap) {
    return Container(
      width: 78.kw,
      height: 37.kh,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            text,
            style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
