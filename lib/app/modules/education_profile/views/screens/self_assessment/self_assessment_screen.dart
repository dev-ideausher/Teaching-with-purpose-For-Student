
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/constants/string_constants.dart';
import 'package:teaching_with_purpose_student/app/modules/education_profile/controllers/education_profile_controller.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';


class SelfAssessmentScreen extends GetView<EducationProfileController> {
  const SelfAssessmentScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Self-Assessment',isBack: true)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textAlign: TextAlign.center,
                'Find out more about yourself.',
                style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
              ),
              32.kheightBox,
              questionCard("What's Your Learning Style?", StringConstants.selfAssesmentText1,() {}),
              4.kheightBox,
              questionCard('Defining Your Personality', StringConstants.selfAssesmentText2, (){}),
            ],
          ),
        ),
      ),
    );
  }

//
  Widget questionCard(String question, String text, void Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Get.context!.kWhite),
        height: 127.kh,
        width: 327.kw,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    question,
                    style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
                  ),
                  const Icon(Icons.arrow_forward,size: 17)
                ],
              ),
              8.kheightBox,
              Text(
                textAlign: TextAlign.left,
                text,
                style: TextStyleUtil.kText14_4(
                    fontWeight: FontWeight.w400, color:Get.context!.kLightTextColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
