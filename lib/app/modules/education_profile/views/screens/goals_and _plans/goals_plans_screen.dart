import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/constants/string_constants.dart';
import 'package:teaching_with_purpose_student/app/modules/education_profile/controllers/education_profile_controller.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/custom_button.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';


class GoalsandPlans extends GetWidget<EducationProfileController> {
  const GoalsandPlans({super.key});
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Goals and Plans',isBack: true)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              rowWidget('Make future plans', 'Add plan'),
              16.kheightBox,
              cardWidget('What will you do after high school ?'),
              32.kheightBox,
              rowWidget('Set Personal Goals', 'Add goal'),
              16.kheightBox,
              cardWidget('What will you do after high school ?'),            
            ],
          ),
        ),
      ),
    );
  }


//row widget
  Widget rowWidget(String text1, String text2) { 
    return Row(
      children: [
        Text(
          textAlign: TextAlign.center,
          text1,
          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
        ),
        const Spacer(),
        Assets.svg.plusAdd.svg(),
        Text(
          textAlign: TextAlign.center,
          text2,
          style: TextStyleUtil.kText14_4(
              fontWeight: FontWeight.w400, color: Get.context!.kPrimary),
        ),
      ],
    );
  }

  //card widget
  Widget cardWidget(String text1) {
    return SizedBox(
      height: 200.kh,
      width: 343.kw,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Assets.svg.note.svg(),
              16.kheightBox,
              Text(
                textAlign: TextAlign.center,
                text1,
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ), 
              8.kheightBox,
              SizedBox(
                width: 113.kw,
                height: 37.kh,
                child: StButton(title: StringConstants.makeAPlan, onTap: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
