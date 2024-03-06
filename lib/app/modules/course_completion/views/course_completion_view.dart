import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/components/custom_subjectvertical_card.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../components/custom_chapterwise_card.dart';
import '../controllers/course_completion_controller.dart';

class CourseCompletionView extends GetView<CourseCompletionController> {
  const CourseCompletionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Course Completion',isBack: true)),
      body:SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              subjectsWidget(),
              32.kheightBox,
              SizedBox(
                height: 119.kh,
                width: 343.kw,
                child: Stack(
                  children: [
                    Center(
                        child: percentageIndicater(
                            0.75, 
                            '75%', 
                            'Course completion', 
                            () {}
                        )),
                    Align(
                      alignment: Alignment.topRight,
                      child:Assets.svg.bigDarkVersionRight.svg(),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child:Assets.svg.bigDarkVersionLeft.svg(),
                    )
                  ],
                ),
              ),
              32.kheightBox,
            Text(
              'Chapter Wise',
              style:TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
              16.kheightBox,
              CustomChapterWiseCard(
                  img: Assets.svg.editPencil,
                  text1: 'Chapter 1 : ',
                  text2: 'Relations and Functions I',
                  text3: 'Progress : 100%',
                  widget:LinearPercentIndicator(
                  animation: true,
                  width: 253.kw,
                  lineHeight: 4.kh,
                  percent: 1,
                  progressColor: Get.context!.kPrimary,
                ),
              ),
              8.kheightBox,
              CustomChapterWiseCard(
                  img: Assets.svg.editPencil,
                  text1: 'Chapter 1 : ',
                  text2: 'Relations and Functions I',
                  text3: 'Progress : 100%',
                  widget:LinearPercentIndicator(
                  animation: true,
                  width: 253.kw,
                  lineHeight: 4.kh,
                  percent: 1,
                  progressColor: Get.context!.kPrimary,
                ),
              ),
              8.kheightBox,
              CustomChapterWiseCard(
                  img: Assets.svg.editPencil,
                  text1: 'Chapter 1 : ',
                  text2: 'Relations and Functions I',
                  text3: 'Progress : 100%',
                  widget:LinearPercentIndicator(
                  animation: true,
                  width: 253.kw,
                  lineHeight: 4.kh,
                  percent: 1,
                  progressColor: Get.context!.kPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // display subjects
  Widget subjectsWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.center,
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
                    final isSelected =
                        controller.selectedSubjectIndex.value == index;
                    return InkWell(
                      onTap: () =>
                          controller.selectedSubjectIndex.value = index,
                      child: CustomSubjectCardVertical(
                        text: controller.subjectText[index],
                        color: isSelected ? context.kPrimary : context.kWhite,
                        svgImage: controller.subjectImage[index],
                      ),
                    );
                  })),
        ),
      ],
    );
  }

//percentage indicater .........
  Widget percentageIndicater(
      double percent, String text1, String text2, void Function() onTap) {
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
                animation: true,
                percent: percent,
                center: Text(text1,
                    style:
                        TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
              ),
              8.kheightBox,
              Text(
                text2,
                style: TextStyleUtil.kText12_4(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
