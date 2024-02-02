import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/modules/live_quizz/controllers/live_quizz_controller.dart';
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
        child: CustomAppBar(title: 'Live Quizzes', isBack: true)),
        body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                'Time left',
                style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
                16.kheightBox,
                Center(
                  child: Container(
                  height: 96.kh,
                  width: 96.kw,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                  color: context.kPrimary,
                  shape: BoxShape.circle),
                  child: Obx(() => Text(
                  '0.${controller.timerSeconds.value}sec',
                    style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600, color: Get.context!.kWhite),
                  ),)
                ),
                ),
              40.kheightBox,
              buildQuizzCard(
              marks:controller.questions[0].points.toString() ,
              question: controller.questions[0].questionText ?? '',
              options: controller.questions[0].options ?? []
              ),
              40.kheightBox,
               SizedBox(
                width: 343.kw,
                height: 56.kh,
                child: controller.quizSubmitted
                    ? Text('Quiz Already Submitted',style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500))
                    : StButton(
                        title: 'Submit',
                        onTap: () {
                          controller.submitQuizz();
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildQuizzCard({required String question, required String marks, required List<String?> options}) {
    List<String> stringOptions = options.map((option) => option.toString()).toList();
    return SizedBox(
      height: 420.kh,
      width: 345.kw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Question',
                style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
              ),
              151.kwidthBox,
              Text(
                'Points : $marks',
                style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor,
                ),
              ),
            ],
          ),
          24.kheightBox,
          Text(
            question,
            maxLines: 3,
            style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400),
          ),
          24.kheightBox,
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
                    child: Obx(() => Container(
                      height: 56,
                      width: 343.kw,
                      decoration: BoxDecoration(
                        color: getOptionCOlor(index),
                        border: Border.all(color: Get.context!.kNeutral, width: 0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          stringOptions[index],
                          style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: getOptionTextColor(index),
                          ),
                        ),
                      ),
                    ))
                );
              },
            ),
          ),
        ],
      ),
    );
  }

 getOptionCOlor(int index){
  int correctOption = controller.questions[0].answer! - 1;
  bool isCorrectOption = (controller.selectedOptionIndex.value == correctOption);
  if(controller.showcorrectAnswer.value && index == correctOption) {
    return Colors.green;
  }
    return (controller.selectedOptionIndex.value == index)
          ? (isCorrectOption ? Colors.green : Colors.red)
          : Colors.white;
 }

 
  Color getOptionTextColor(int index) {
    if (controller.selectedOption != null) {
      return (controller.selectedOption == index) ? Colors.white : Colors.black;
    }

    return Colors.black;
  }
}
