import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/components/custom_result_card.dart';
import 'package:teaching_with_purpose_student/app/components/custom_subjectvertical_card.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';

import '../controllers/assignment_completion_controller.dart';

class AssignmentCompletionView extends GetView<AssignmentCompletionController> {
  const AssignmentCompletionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Assignment Completion',isBack: true)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            //
             subjectsWidget(),
             32.kheightBox,
              SizedBox(
                height: 119.kh,
                width: 343.kw,
                child: Stack(
                  children: [
                    Center(
                    child: percentageIndicater(
                    0.75, '75%', 'Assignment Performance', (){})),
                    Align(
                      alignment: Alignment.topRight,
                      child:Assets.svg.bigDarkVersionRight.svg(),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Assets.svg.bigDarkVersionLeft.svg(),
                    )
                  ],
                ),
              ),
              32.kheightBox,
            Text(
              'Assignment Submitted',
              style:TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
            16.kheightBox,
            CustomResultCard(
                  svg1: Assets.svg.editPencil,
                  title: 'Assignment 1',
                  subtitle: 'Topic: Ordered Pair',
                  text1: 'Marks obtained: ',
                  text2: '23/30',
                  svg2: Assets.svg.eye,
                  svg3: Assets.svg.download),
              8.kheightBox,
            CustomResultCard(
                  svg1: Assets.svg.editPencil,
                  title: 'Assignment 1',
                  subtitle: 'Topic: Ordered Pair',
                  text1: 'Marks obtained: ',
                  text2: '23/30',
                  svg2: Assets.svg.eye,
                  svg3: Assets.svg.download),
              8.kheightBox, 
            CustomResultCard(
                  svg1: Assets.svg.editPencil,
                  title: 'Assignment 1',
                  subtitle: 'Topic: Ordered Pair',
                  text1: 'Marks obtained: ',
                  text2: '23/30',
                  svg2: Assets.svg.eye,
                  svg3: Assets.svg.download),  
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
                      onTap: () => controller.selectedSubjectIndex.value = index,
                      child: CustomSubjectCardVertical(
                        text: controller.subjectText[index],
                        color: isSelected ? context.kRed : context.kWhite,
                        svgImage: controller.subjectImage[index],
                      ),
                    );
                  })),
        ),
      ],
    );
  }

  Widget percentageIndicater(double percent, String text1, String text2, void Function() onTap) {
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
                center: Text(
                text1,
                style:TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
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
