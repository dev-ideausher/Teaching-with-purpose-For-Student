import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/custom_button.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';


import '../controllers/live_quizz_controller.dart';

class LiveQuizzView extends GetView<LiveQuizzController> {
  const LiveQuizzView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size.fromHeight(46.kh),
          child: CustomAppBar(title: 'Live Quizzes', isBack: true)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 69),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
               Text(
                'Quizz',
                style: TextStyleUtil.kText16_5(
                    fontWeight: FontWeight.w500),
              ),
            8.kheightBox,
               Text(
                '1 Question',
                style: TextStyleUtil.kText14_4(
                    fontWeight: FontWeight.w400,color: context.kLightTextColor),
              ),
            16.kheightBox,
               Text(
                'Conducted by:',
                style: TextStyleUtil.kText16_5(
                    fontWeight: FontWeight.w500),
              ),
            8.kheightBox,
               Text(
                'John Doe',
                style: TextStyleUtil.kText14_4(
                    fontWeight: FontWeight.w400,color: context.kLightTextColor),
              ),
            16.kheightBox,
               Text(
                'Topics Covered',
                style: TextStyleUtil.kText16_5(
                    fontWeight: FontWeight.w500),
              ),
            8.kheightBox,
               Text(
                '',
                style: TextStyleUtil.kText14_4(
                    fontWeight: FontWeight.w400,color: context.kLightTextColor),
              ),
             16.kheightBox,
               Text(
                'Instructions',
                style: TextStyleUtil.kText16_5(
                    fontWeight: FontWeight.w500),
              ),
              8.kheightBox,
               Text(
                'Read instructions carefully',
                style: TextStyleUtil.kText14_4(
                    fontWeight: FontWeight.w400,color: context.kLightTextColor),
              ),
              137.kheightBox,
                SizedBox(
                    width: 343.kw,
                    height: 56.kh,
                    child: StButton(title: 'Starts Quizz', onTap: () {Get.offAllNamed(Routes.START_QUIZZ);})),                                                             
            ],
          ),
        ), 
      ),
    );
  }
}
