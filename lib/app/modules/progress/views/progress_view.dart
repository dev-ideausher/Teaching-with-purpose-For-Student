import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:teaching_with_purpose_student/app/components/commom_richtext.dart';
import 'package:teaching_with_purpose_student/app/components/common_table.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/components/stsubject_vertical.dart';
import 'package:teaching_with_purpose_student/app/constants/image_constant.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import '../controllers/progress_controller.dart';

class ProgressView extends GetView<ProgressController> {
  const ProgressView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: controller.selectedTabIndex.value,
      length: 2,
      child: Scaffold(
        backgroundColor: context.kGreyBack,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.kh),
            child: CustomAppBar(title: 'Progress', isBack: false,
            bottom: TabBar(
              controller: controller.tabController,
              indicatorWeight: 3,
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
              indicatorColor: context.kPrimary,
              labelColor: context.kPrimary,
              unselectedLabelColor: context.kLightTextColor,
              tabs: [
                SizedBox(
                  height: 27.kh,
                  width: 170.kw,
                  child: const Tab(text: 'Progress')),
                SizedBox(
                  height: 27.kh,
                  width: 170.kw,
                  child: const Tab(text: 'Performance')),
          ]) ,
        )),
           body: TabBarView(
            controller: controller.tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              buildTab(),
              buildTab(),
            ]),
      ),
    );
  }

  Widget buildTab() {
    return Obx(() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                subjectsWidget(),
                controller.selectedTabIndex.value == 0 ? overallTrackingWidget(): scoreBoard(),
                controller.selectedTabIndex.value == 0 ? feebackWidget(): keyfocusWidget()
              ],
            ),
          ),
    ));
  }

  // display subjects
  Widget subjectsWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Subjects',
          style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
        ),
        16.kheightBox,
        SizedBox(
          height: 101.kh,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => 16.kwidthBox,
              itemCount: controller.subjectImage.length,
              itemBuilder: (context, index) => Obx(() {
                    final isSelected = controller.selectedSubjectIndex.value == index;
                    return InkWell(
                      onTap: () =>controller.selectedSubjectIndex.value = index,
                      child: StSubjectVertical(
                          text: controller.subjectText[index],
                          color: isSelected ? context.kRed : context.kWhite,
                          svgImage: controller.subjectImage[index]),
                    );
                  })),
        ),
        32.kheightBox,
      ],
    );
  }

  // widget for overtracking of student
Widget overallTrackingWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Overall Tracking',
        style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
      ),
      16.kheightBox,
      GridView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.352,
          crossAxisCount: 2,
          crossAxisSpacing: 13,
          mainAxisSpacing: 16,
        ),
        children: [
          percentageIndicater(0.75, '75%', 'Assignment completion tracking',() => Get.toNamed(Routes.ASSIGNMENT_COMPLETION)),
          percentageIndicater(0.75, '75%', 'Homework completion tracking',()=> Get.toNamed(Routes.COURSE_COMPLETION)),
          percentageIndicater(0.75, '75%', 'Exam score tracking',()=> Get.toNamed(Routes.EXAM_SCORE)),
          percentageIndicater(1, 'View', 'Student Behavior',()=> Get.toNamed(Routes.STUDENT_BEHAVIOR)),
        ],
      ),
      32.kheightBox,
    ],
  );
}}

  // Widget
  Widget scoreBoard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Scorecard',
          style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
        ),
        16.kheightBox,
        SizedBox(
          height: 248.kh,
          width: 343.kw,
          child: const CommoncardTable(),
        ),
      // Container(
      // height: 37.kh,width: 343.kw,
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Get.context!.kAverageMarkColor),
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: [
      //   Text('Average marks',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
      //   Text('A', style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)), 
      //   Text('86',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),         
      //   ],
      // ),
      // ),
    32.kheightBox
      ],
    );
  }

  // teachers feebback
  Widget feebackWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
        'Teacher’s Feedback',style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
        24.kheightBox,
        feedback(ImageConstant.profileImg, 'Esther Howard','It’s good to see improvement in English so far.', '01:50 pm'),
        8.kheightBox,
        feedback(ImageConstant.profileImg, 'Esther Howard','It’s good to see improvement in English so far.', '01:50 pm'),
      ],
    );
  }

// key focus areas
  Widget keyfocusWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Key Focus Areas',style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
        24.kheightBox,
        keyFocus(ImageConstant.focousIcon,'Mathematics : ', 'Relations and Functions I', 'Average'),
        8.kheightBox,
        keyFocus(ImageConstant.focousIcon,'Mathematics : ', 'Relations and Functions I', 'Average'),
      ],
    );
  }

  // prcentage progress indiacater for marks and all
Widget percentageIndicater(double percent, String text1, String text2,void Function () onTap) {
  return InkWell(
    onTap: onTap,
    child: SizedBox(
      width: 165.kw,
      height: 122.kh,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Column(
          children: [
            CircularPercentIndicator(
              radius: 30,
              lineWidth: 8,
              progressColor: Get.context!.kPrimary,
              backgroundColor: Get.context!.kLightSkyBlue,
              animation: true,
              percent: percent,
              center: Text( text1,style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
            ),
            8.kheightBox,
            Text( text2, textAlign: TextAlign.center,style: TextStyleUtil.kText12_4(fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    ),
  );
}

//Widget for feedback section by teachers
  Widget feedback(String feebackimg, String teacherName, String statement, String time) {
    return SizedBox(
      height: 79.kh,
      width: 343.kw,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(feebackimg, height: 30.kh, width: 30.kw)),
            12.kwidthBox,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( teacherName,textAlign: TextAlign.center,style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500)),
                  4.kheightBox,
                  Text( statement, maxLines: 2,
                    style: TextStyleUtil.kText12_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor)),
                ],
              ),
            ),
            32.kwidthBox,
            Text( time, maxLines: 1,textAlign: TextAlign.center,
              style: TextStyleUtil.kText12_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor)),
          ],
        ),
      ),
    );
  }

  //widget for key-focus
  Widget keyFocus(String focusImg, String subject, String area,String performance) {
    return SizedBox(
      width: 343.kw,
      height: 60.kh,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 24, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(focusImg, height: 24.kh, width: 24.kw),
            16.kwidthBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReUsableRichText(
                    text1: subject,
                    text2: area,
                    style1:TextStyleUtil.kText14_4(fontWeight: FontWeight.w600),
                    style2: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600,color: Get.context!.kLightTextColor)),
                8.kheightBox,
                ReUsableRichText(
                    text1: 'Performance : ',
                    text2: performance,
                    style1:TextStyleUtil.kText12_4(fontWeight: FontWeight.w400),
                    style2: TextStyleUtil.kText12_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor)),
              ],
            )
          ],
        ),
      ),
    );
  }


