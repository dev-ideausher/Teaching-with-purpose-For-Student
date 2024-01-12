import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/modules/live_quizz/controllers/live_quizz_controller.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/custom_button.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';


class StartQuizzView extends GetWidget<LiveQuizzController> {
  const StartQuizzView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(46.kh),
        child: CustomAppBar(title: 'Live Quizzes', isBack: true),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            children: [
              SizedBox(
                height: 420.kh,
                width: 345.kw,
                child: ListView.separated(
                  separatorBuilder: (context, index) => 16.kheightBox,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return buildQuizzCard();
                  },
                ),
              ),
              40.kheightBox,
                SizedBox(
                    width: 343.kw,
                    height: 56.kh,
                  child: StButton(
                      title: 'Submit',
                      onTap: () {Get.toNamed(Routes.QUIZZ_SUCESS);})),            
            ],
          ),
        ),
      ),
    );
  }

  Widget buildQuizzCard() {
    return SizedBox(
      height: 420.kh,
      width: 345.kw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Question 1 of 1',
                style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
              ),
              151.kwidthBox,
              Text(
                '10 points',
                style: TextStyleUtil.kText16_5(
                    fontWeight: FontWeight.w400,
                    color: Get.context!.kLightTextColor),
              ),
            ],
          ),
          24.kheightBox,
          Text(
            ' What is the past tense of "sleep"?',
            maxLines: 3,
            style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400),
          ),
          24.kheightBox,
          SizedBox(
            height: 260.kw,
            width: 343.kw,
            child: ListView.separated(
              separatorBuilder: (context, index) => 8.kheightBox,
              itemCount: 4,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  controller.selectOption(index);
                },
                child: Obx(() => Container(
                      height: 56,
                      width: 343.kw,
                      decoration: BoxDecoration(
                        color: controller.selectedOptionIndex.value == index
                            ? Get.context!.kPrimary
                            : Get.context!.kWhitelight,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          controller.answer[index],
                          style: TextStyleUtil.kText14_4(
                            fontWeight: FontWeight.w400,
                            color: controller.selectedOptionIndex.value == index
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
