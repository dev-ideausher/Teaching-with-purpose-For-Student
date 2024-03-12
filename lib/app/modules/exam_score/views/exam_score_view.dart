import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/constants/image_constant.dart';
import 'package:teaching_with_purpose_student/app/constants/widget_constants.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';

import '../../../../gen/assets.gen.dart';
import '../../../components/custom_subjectvertical_card.dart';
import '../controllers/exam_score_controller.dart';

class ExamScoreView extends GetView<ExamScoreController> {
  const ExamScoreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Exam Score', isBack: true)
     ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
      Text(
        'Exam Type',
        style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
      ),
      8.kheightBox,
      Obx(() => Container(
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
                value: 'In between quiz',
                child: Text('In between quiz', style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400)),
              ),
              DropdownMenuItem(
                value: 'live-quiz',
                child: Text('live-quiz', style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400)),
              ),
            ],
            value: controller.selectedExamType.value,
            onChanged: (String? newValue) {
              controller.selectedExamType.value = newValue!;
            },
          ),
        ),
      ),
    ),
      32.kheightBox,
             subjectsWidget(),
             32.kheightBox,
              SizedBox(
                height: 119.kh,
                width: 343.kw,
                child: Stack(
                  children: [
                    Center(
                        child: percentageIndicater(
                            0.75, '75%', 'Exam Score', () {})),
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
            'Result',
            style:TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
            16.kheightBox,
            WidgetsConstants.resultWidget(
            text: 'Quiz' ,
            topic: 'Ordered Pair',
            marks: '23/30'
            ),
            32.kheightBox,  
            Text(
              "Area Of Improvement / Feedback",
              style:TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
            16.kheightBox,
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => 8.kheightBox,
                  itemCount: 2,
                  itemBuilder: (context, index) => WidgetsConstants.keyFocus(
                      ImageConstant.focousIcon,
                      'Topic : ',
                      'Relations and Functions I',
                      'Performance : Average'
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
                center: Text(text1,
                    style:
                        TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
              ),
              8.kheightBox,
              Text(
                textAlign: TextAlign.center,
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
