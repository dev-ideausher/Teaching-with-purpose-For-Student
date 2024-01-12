import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/components/custom_textfield.dart';
import 'package:teaching_with_purpose_student/app/components/stfeeback_ratingcircle.dart';
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
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Student Feedback',isBack: true)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              feedbackTextfelds(
                  'Teacher’s Name', 'Enter Name', controller.nameController),
              feedbackTextfelds(
                  'Subject', 'Enter Subject', controller.subjectController),
              feedbackTextfelds('Class & Section', 'Enter Class & Section',
                  controller.classController),
              Text(
                textAlign: TextAlign.left,
                StringConstants.feedbackText,
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
              8.kheightBox,
              Text(
                textAlign: TextAlign.left,
                StringConstants.metricText,
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),
              8.kheightBox,
              Text(
                textAlign: TextAlign.left,
                StringConstants.ratingText,
                style: TextStyleUtil.kText14_4(
                    fontWeight: FontWeight.w400,
                    color: context.kLightTextColor),
              ),
              24.kheightBox,
              ratingWidget('How is the general state of the class?'),
              24.kheightBox,
              ratingWidget('How is the course content?'),
              24.kheightBox,
              ratingWidget('Please evaluate the audio and visual connectivity.'),
              24.kheightBox,
              ratingWidget('The lecture in class was well-structured and coordinated.'),
              24.kheightBox,
              ratingWidget('The learning materials were readily available.'),
             24.kheightBox,
              Text(
                textAlign: TextAlign.left,
                'We would like to hear if you have any comments/suggestions about the course and class.',
                style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400),
              ),
              40.kheightBox,
              SizedBox(
                  width: 343.kw,
                  height: 56.kh,
                  child: StButton(
                      title: StringConstants.submit,
                      onTap: (){}),
                ),
            ],
          ),
        ),
      ),
    );
  }


// widget for calling textfiels insted of calling one by one
  Widget feedbackTextfelds(
      String title, String inputText, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            textAlign: TextAlign.center,
            title,
            style: TextStyleUtil.kText14_4(
                fontWeight: FontWeight.w500,
                color: Get.context!.kLightTextColor)),
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
  Widget ratingWidget(String qText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
        qText,
        textAlign: TextAlign.left,
        style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400)),
      16.kheightBox,
      SizedBox(
        height: 48.kh,
        child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => 16.kwidthBox, 
        itemCount: 5,
          itemBuilder: (context, index) => FeedbackratingCircle(text: controller.ratingNumbers[index] , onTap: (){}),
        ),
       )     
      ],
    );
  }
}
