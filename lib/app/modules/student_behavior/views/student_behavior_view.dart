import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';

import '../../../../gen/assets.gen.dart';
import '../../../components/custom_appbar.dart';
import '../../../components/custom_subjectvertical_card.dart';
import '../../../services/text_style_util.dart';
import '../controllers/student_behavior_controller.dart';

class StudentBehaviorView extends GetView<StudentBehaviorController> {
  const StudentBehaviorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Student Behavior',isBack: true)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
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
                    0.75, '75%', 'Student Behavior', () {})),
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
              Text('Behavior aspects',
                  style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
              16.kheightBox,
              behaaviorWidget(),
              8.kheightBox,
              behaaviorWidget(),
              8.kheightBox,
              behaaviorWidget(),
              8.kheightBox,
              behaaviorWidget(),
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

//.....percentagewidget........
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
                center: Text(
                text1,
                style:TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
              ),
              8.kheightBox,
              Text(
                text2,
                textAlign: TextAlign.center,
                style: TextStyleUtil.kText12_4(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget behaaviorWidget() {
    return SizedBox(
      height: 122.kh,
      width: 343.kw,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 16, 12, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Assets.svg.editPencil.svg(height: 24.kh,width: 24.kw),
          12.kwidthBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(
                'Initiative',
                style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500)),
            8.kheightBox,
            Container(
              height: 58.kh,
              width: 253.kw,
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              decoration: BoxDecoration(
                color: Get.context!.kWhitelight,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Text(
                'Lorem ipsum dolor sit amet consectetur. Maecenas amet aenean',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor)),
            )           
            ],
          )
          ],
        ),
      ),
    );
  }
}
