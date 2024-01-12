import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/modules/education_profile/controllers/education_profile_controller.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';


class DiscussionFormScreen extends GetView<EducationProfileController> {
  const DiscussionFormScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Discussion Form',isBack: true)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: ()=> Get.toNamed(Routes.SELECTED_DISCUSSION),
                child: subjectDiscussion(
                    'Biology',
                    'Lorem Ipsum ed ut perspiciatis unde omnis iste natus error sit voluptatem.',
                    '10 questions'),
              ),
              16.kheightBox,
              subjectDiscussion(
                  'Mathematics',
                  'Lorem Ipsum ed ut perspiciatis unde omnis iste natus error sit voluptatem.',
                  '10 questions'),
              16.kheightBox,
              subjectDiscussion(
                  'English',
                  'Lorem Ipsum ed ut perspiciatis unde omnis iste natus error sit voluptatem.',
                  '10 questions'),
              16.kheightBox,
              subjectDiscussion(
                  'Chemistry',
                  'Lorem Ipsum ed ut perspiciatis unde omnis iste natus error sit voluptatem.',
                  '10 questions'),
            ],
          ),
        ),
      ),
    );
  }


// widget for different subjects
  Widget subjectDiscussion(String title, String text, String text2) {
    return Container(
      height: 145.kh,
      width: 343.kw,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Get.context!.kWhite),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  title,
                  style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
                ),
                16.kheightBox,
                Text(
                  textAlign: TextAlign.center,
                  text,
                  style: TextStyleUtil.kText12_4(
                      fontWeight: FontWeight.w400,
                      color: Get.context!.kLightTextColor),
                ),
                16.kheightBox,
                Text(
                  textAlign: TextAlign.left,
                  text2,
                  style: TextStyleUtil.kText12_4(
                      fontWeight: FontWeight.w500,
                      color: Get.context!.kLightTextColor),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Assets.svg.discusionDec.svg(),
          )
        ],
      ),
    );
  }
}
