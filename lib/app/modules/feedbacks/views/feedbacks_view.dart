

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/components/custom_textfield.dart';
import 'package:teaching_with_purpose_student/app/constants/string_constants.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/custom_button.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';

import '../../../services/text_style_util.dart';
import '../controllers/feedbacks_controller.dart';

class FeedbacksView extends GetView<FeedbacksController> {
  const FeedbacksView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: PreferredSize(
    preferredSize: Size.fromHeight(46.kh),
    child: CustomAppBar(title: 'Student Feedback', isBack: true),
  ),
  body: SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          feedbackTextfelds(
            title: 'Teacher’s Name',
            inputText: 'Enter Name',
            controller: controller.nameController,
          ),
          feedbackTextfelds(
            title: 'Subject',
            inputText: 'Enter Subject',
            controller: controller.subjectController,
          ),
          feedbackTextfelds(
            title: 'Class & Section',
            inputText: 'Enter Class & Section',
            controller: controller.classController,
          ),
          Text(
            StringConstants.feedbackText,
            textAlign: TextAlign.left,
            style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
          ),
          8.kheightBox,
          Text(
            StringConstants.metricText,
            textAlign: TextAlign.left,
            style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
          ),
          8.kheightBox,
          Text(
            StringConstants.ratingText,
            textAlign: TextAlign.left,
            style: TextStyleUtil.kText14_4(
              fontWeight: FontWeight.w400,
              color: context.kLightTextColor,
            ),
          ),
          24.kheightBox,
          ratingWidget(
            qText: 'How is the general state of the class?',
            questionIndex: 0,
          ),
          24.kheightBox,
          ratingWidget(
           qText:  'How is the course content?',
            questionIndex: 1,
          ),
          24.kheightBox,
          ratingWidget(
            qText: 'Please evaluate the audio and visual connectivity.',
            questionIndex: 2,
          ),
          24.kheightBox,
          ratingWidget(
            qText: 'The lecture in class was well-structured and coordinated.',
            questionIndex: 3,
          ),
          24.kheightBox,
          ratingWidget(
            qText: 'The learning materials were readily available.',
            questionIndex: 4,
          ),
          24.kheightBox,
          Text(
            'We would like to hear if you have any comments/suggestions about the course and class.',
            textAlign: TextAlign.left,
            style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400),
          ),
          40.kheightBox,
          SizedBox(
            width: 343.kw,
            height: 56.kh,
            child: StButton(
              title: StringConstants.submit,
              onTap: () {
                // controller.sendFeedbacks();
              },
            ),
          ),
        ],
      ),
    ),
  ),
);
  }


// widget for calling textfiels insted of calling one by one
  Widget feedbackTextfelds({required String title, required String inputText, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            textAlign: TextAlign.center,
            title,
            style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500,color: Get.context!.kLightTextColor)),
        8.kheightBox,
        StTextField(
            hint: inputText,
            controller: controller,
            textInputType: TextInputType.emailAddress),
        24.kheightBox,
      ],
    );
  }

// rating  sections using nbr
Widget ratingWidget({required String qText, required int questionIndex}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        qText,
        textAlign: TextAlign.left,
        style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400),
      ),
      16.kheightBox,
      SizedBox(
        height: 48.kh,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => 16.kwidthBox,
          itemCount: 5,
          itemBuilder: (context, index) =>
              ratingNumbers(controller.ratingNumbers[index], questionIndex),
        ),
      ),
    ],
  );
}



Widget ratingNumbers(String text, int questionIndex) {
  return InkWell(
        onTap: () {
          controller.changeRating(questionIndex, text);
        },
        child: Container(
          height: 40.kh,
          width: 40.kw,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: controller.selectedRatings[questionIndex] == text
                ? Get.context!.kPrimary
                : Get.context!.kWhite,
            border: Border.all(
              color: Get.context!.kPrimary,
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w500,
                color: controller.selectedRatings[questionIndex] == text
                    ? Get.context!.kWhite
                    : Get.context!.kPrimary,
              ),
            ),
          ),
        ),
      );
}

}
