import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/modules/education_profile/controllers/education_profile_controller.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';


class PersonalAchievementsScreen extends GetView<EducationProfileController> {
  const PersonalAchievementsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Personal Achievements',isBack: true)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              achievementSectionWidget(
                  Assets.svg.personal, 'Add licenses and certificates', () {}),
              16.kheightBox,
              achievementSectionWidget(
                  Assets.svg.personal, 'Add workshops and training', () {}),
              16.kheightBox,
              achievementSectionWidget(
                  Assets.svg.personal, 'Add volunteer work', () {}),
              16.kheightBox,
              achievementSectionWidget(
                  Assets.svg.personal, 'Add an activity', () {}),
              16.kheightBox,
              achievementSectionWidget(
                  Assets.svg.personal, 'Add projects', () {}),
              16.kheightBox,
              achievementSectionWidget(
                  Assets.svg.personal, 'Add honors & awards', () {}),
            ],
          ),
        ),
      ),
    );
  }


  Widget achievementSectionWidget(
      SvgGenImage image, String title, void Function() onTap, ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 57.kh,
        width: 343.kw,
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Get.context!.kWhite),
        child: Row(
          children: [
            image.svg(),
            8.kwidthBox,
            Text(
                textAlign: TextAlign.center,
                title,
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500)),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 15)
          ],
        ),
      ),
    );
  }
}
