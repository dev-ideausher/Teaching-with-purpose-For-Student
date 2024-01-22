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
                  buildQuizzCard(
                      question: controller.questions[0].questionText ?? '',
                      options: controller.questions[0].options ?? []),
                  40.kheightBox,
              Obx(() => Text(
                    'Time Remaining: ${controller.timerSeconds.value} seconds',
                    style: TextStyleUtil.kText16_5(
                      fontWeight: FontWeight.w600,
                      color: context.kPrimary,
                    ),
                  )),
              20.kheightBox,
              SizedBox(
                width: 343.kw,
                height: 56.kh,
                child: StButton(
                  title: 'Submit',
                  onTap: () {
                    Get.toNamed(Routes.QUIZZ_SUCESS);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildQuizzCard(
      {required String question, required List<dynamic> options}) {
    List<String> stringOptions =
        options.map((option) => option.toString()).toList();
    return SizedBox(
      height: 420.kh,
      width: 345.kw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Question 1 ',
                style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
              ),
              151.kwidthBox,
              Text(
                '10 points',
                style: TextStyleUtil.kText16_5(
                  fontWeight: FontWeight.w400,
                  color: Get.context!.kLightTextColor,
                ),
              ),
            ],
          ),
          24.kheightBox,
          //show question here
          Text(
            question,
            maxLines: 3,
            style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400),
          ),
          24.kheightBox,
          //options here
          SizedBox(
            height: 260.kw,
            width: 343.kw,
            child: ListView.separated(
              separatorBuilder: (context, index) => 8.kheightBox,
              itemCount: controller.questions[0].options?.length ?? 0,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      controller.selectOption(index);
                    },
                    child: Container(
                      height: 56,
                      width: 343.kw,
                      decoration: BoxDecoration(
                        color: getOptionColor(index),
                        border: Border.all(
                            color: Get.context!.kNeutral, width: 0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          stringOptions[index],
                          style: TextStyleUtil.kText14_4(
                            fontWeight: FontWeight.w400,
                            color: getOptionTextColor(index),
                          ),
                        ),
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }

  Color getOptionColor(int index) {
    if (controller.selectedOption != null) {
      bool isCorrectOption =
          (controller.selectedOption == controller.questions[0].answer! - 1);
      return (controller.selectedOption == index)
          ? (isCorrectOption ? Colors.green : Colors.red)
          : Colors.white;
    }

    return Colors.white;
  }

  Color getOptionTextColor(int index) {
    if (controller.selectedOption != null) {
      return (controller.selectedOption == index) ? Colors.white : Colors.black;
    }

    return Colors.black;
  }
}
