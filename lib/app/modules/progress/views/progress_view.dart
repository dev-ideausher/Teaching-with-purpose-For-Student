import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/components/stsubject_vertical.dart';
import 'package:teaching_with_purpose_student/app/constants/image_constant.dart';
import 'package:teaching_with_purpose_student/app/constants/widget_constants.dart';
import 'package:teaching_with_purpose_student/app/modules/home/controllers/home_controller.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import '../controllers/progress_controller.dart';

class ProgressView extends GetView<ProgressController> {
  const ProgressView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //log('progresssCtlr...${Get.isRegistered<ProgressController>()}');
    return Scaffold(
      backgroundColor: context.kGreyBack,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.kh),
          child: CustomAppBar(
            title: 'Progress',
            isBack: false,
            bottom: TabBar(
              controller: controller.tabController,
              indicatorColor: context.kPrimary,
              labelColor: context.kPrimary,
              unselectedLabelColor: context.kLightTextColor,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              tabs: [
                SizedBox(width: 170.kw, child: const Tab(text: 'Progress')),
                SizedBox(width: 170.kw, child: const Tab(text: 'Performance')),
              ],
              onTap: (index) => controller.selectedTabIndex.value,
            ),
          ),
          ),
      body: Obx(() => controller.isLoading.value
           ? Center(child: CircularProgressIndicator(color: context.kPrimary))
           : TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.tabController,
            children: [
              buildTab(),
              buildTab(),
            ],
          ))
    );
  }

Widget buildTab() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          if (controller.selectedTabIndex.value == 0) 
          const SizedBox()
          else
          dropdawnWidget(),
          subjectsWidget(),
          if (controller.selectedTabIndex.value == 0) 
          overallTrackingWidget() 
          else 
          scoreBoard(),
          if (controller.selectedTabIndex.value == 0) 
          feebackWidget() 
          else 
          keyfocusWidget(),
        ],
      ),
    ),
  );
}
  // display subjects
 Widget subjectsWidget() {
  final subjectLists = Get.find<HomeController>().subjectLists.value.data;
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
          itemCount: subjectLists?.length ?? 0,
          itemBuilder: (context, index) {
            final isSelected = controller.selectedSubjectIndex.value == index;
            return InkWell(
              onTap: () {
                String? selectedSubjectId = subjectLists?[index]?.Id;
                controller.selectedSubjectIndex.value = index;
                //log('onTaped..$selectedSubjectId');
                controller.getPerformance(selectedSubjectId: selectedSubjectId);
              },
              child: StSubjectVertical(
                text: subjectLists?[index]?.subject ?? '',
                color: isSelected ? context.kRed : context.kWhite,
                svgImage: controller.subjectImage[index],
              ),
            );
          },
        ),
      ),
      32.kheightBox,
    ],
  );
}
//performance -dropdawn
Widget dropdawnWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Exam Type',
        style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
      ),
      8.kheightBox,
      Container(
        width: 343.kw,
        height: 56.kh,
        decoration: BoxDecoration(
          color: Get.context!.kWhite,
          borderRadius: BorderRadius.circular(8),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            items: [
              DropdownMenuItem(
                value: 'yearly',
                child: Text('yearly', style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400)),
              ),
              DropdownMenuItem(
                value: 'half-yearly',
                child: Text('half-yearly', style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400)),
              ),
              DropdownMenuItem(
                value: 'live-quiz',
                child: Text('live-quiz', style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400)),
              ),
              DropdownMenuItem(
                value: 'assignment',
                child: Text('assignment', style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400)),
              ),
            ],
            value: controller.selectedExamType.value,
            onChanged: (String? newValue) {
              controller.selectedExamType.value = newValue!;
              //controller.getPerformance();
            },
          ),
        ),
      ),
      32.kheightBox,
    ],
  );
}
  //Progress
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
            WidgetsConstants.percentageIndicater(
                0.75,
                '75%',
                'Assignment completion tracking',
                () => Get.toNamed(Routes.ASSIGNMENT_COMPLETION)),
            WidgetsConstants.percentageIndicater(
                0.75,
                '75%',
                'Homework completion tracking',
                () => Get.toNamed(Routes.COURSE_COMPLETION)),
            WidgetsConstants.percentageIndicater(
              0.75, 
              '75%',
              'Exam score tracking', 
              () => Get.toNamed(Routes.EXAM_SCORE)),
            WidgetsConstants.percentageIndicater(
              1, 
              'View', 
              'Student Behavior',
              () => Get.toNamed(Routes.STUDENT_BEHAVIOR)),
          ],
        ),
        32.kheightBox,
      ],
    );
  }
  // Performance -ScoreBoard
Widget scoreBoard() {
  final performanceData = controller.performanceModel.value.data;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Scorecard',
        style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
      ),
      16.kheightBox,
      Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Subject', style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400)),
                Text('Grade', style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400)),
                Text('Mark', style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400))
              ],
            ),
          ),
          24.kheightBox,
          SizedBox(
            width: double.infinity,
            child: Column(
              children: List.generate(performanceData?.length ?? 0, (index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      performanceData?[index]?.subject?.subject ?? '',
                      style: TextStyleUtil.kText14_4(
                        fontWeight: FontWeight.w400,
                        color: Get.context!.kLightTextColor,
                      ),
                    ),
                    Text(
                      performanceData?[index]?.markId?.grade ?? '',
                      style: TextStyleUtil.kText14_4(
                        fontWeight: FontWeight.w400,
                        color: Get.context!.kLightTextColor,
                      ),
                    ),
                    Text(
                      performanceData?[index]?.markId?.marks.toString() ?? '',
                      style: TextStyleUtil.kText14_4(
                        fontWeight: FontWeight.w400,
                        color: Get.context!.kLightTextColor,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          10.kheightBox,
          Container(
            height: 37.kh,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Get.context!.kAverageMarkColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Average marks', style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
                Text('A', style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
                Text('86', style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          32.kheightBox,
        ],
      ),
    ],
  );
}
  // Progress-teachers feeback
  Widget feebackWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Teacher’s Feedback',
            style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
        24.kheightBox,
        WidgetsConstants.feedback(
          ImageConstant.profileImg, 
          'Esther Howard',
          'It’s good to see improvement in English so far.', 
          '01:50 pm'),
        8.kheightBox,
        WidgetsConstants.feedback(
        ImageConstant.profileImg, 
        'Esther Howard',
        'It’s good to see improvement in English so far.', 
        '01:50 pm'),
      ],
    );
  }
// Performance-key focus areas
  Widget keyfocusWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Key Focus Areas',
          style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
        ),
        24.kheightBox,
        ListView.separated(
        separatorBuilder: (context, index) => 8.kheightBox, 
        itemCount:controller.performanceModel.value.data?.length?? 0 ,
        itemBuilder: (context, index) => WidgetsConstants.keyFocus(
          ImageConstant.focousIcon, 
          '${controller.performanceModel.value.data?[index]?.topic} : ',
          controller.performanceModel.value.data?[index]?.remarks ?? '', 
          controller.performanceModel.value.data?[index]?.performance ?? '')),
        8.kheightBox,
      ],
    );
  }
}
