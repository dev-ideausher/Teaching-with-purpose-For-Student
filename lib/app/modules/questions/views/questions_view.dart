import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/custom_button.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';

import '../../../services/storage.dart';
import '../controllers/questions_controller.dart';

class QuestionsView extends GetView<QuestionsController> {
  const QuestionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final getStorageService = Get.find<GetStorageService>();
    final chapter = getStorageService.chapter;
    final concept = getStorageService.concept;
    return Scaffold(
      backgroundColor: context.kGreyBack,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(46.kh),
          child: CustomAppBar(title: chapter, isBack: true)),
      body: Obx(() => controller.isLoding.value?
      Center(child: CircularProgressIndicator(color: context.kPrimary)):
        SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  color: context.kconceptColor,
                  child: Text(
                    concept,
                    overflow: TextOverflow.ellipsis,
                    style:TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              40.kheightBox,
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => 16.kheightBox,
                itemCount: controller.questionsModel.value.data?.length??0,
                itemBuilder: (context, index) => 
                buildquestion(
                  questions: controller.questionsModel.value.data?[index]?.question?.first?.questionText?? '',
                  solution: controller.questionsModel.value.data?[index]?.question?.first?.solution ??'',
                  questionIndex: index,
                ),
              ),
            StButton(
              title:'Finish', 
              onTap: () {
              Get.offNamed(Routes.BOTTOM_NAVBAR);
            }),
            ],
          ),
        ),
      )),
    );
  
  }

 Widget buildquestion(
  {required int questionIndex,required String questions,required String solution}){
  return SizedBox(
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Text(
         'Questions',
          style: TextStyleUtil.kText20_6(fontWeight: FontWeight.w600),
        ),
       24.kheightBox,
        Text(
        questions,
        style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500)),
      16.kheightBox,
      ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) =>16.kheightBox, 
        itemCount: 4,
        itemBuilder:(context, index) {
          return GestureDetector(
            onTap: () => controller.selectOption(index, questionIndex),
            child: Obx(() {
            final isSelected = controller.selectedOptionIndex.value == index;
            final isCorrect = index == controller.correctAnswerIndex.value;
            final backgroundColor = isSelected ? (isCorrect ? context.kPrimary : context.kRed) : context.kWhite;
            final textColor = isSelected ? Colors.white : context.kLightTextColor;
            return Container(
            height: 56.kh ,
            width: double.infinity,
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(color: context.kGreyBack),
              borderRadius: BorderRadius.circular(9)
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                    controller.questionsModel.value.data?[questionIndex]?.question?.first?.options?[index]?? '',
                    maxLines: 2,
                    style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500,color: textColor)
                    ),
                  ),
                ],
              ),
            ),
                       );
            })
          );
        },
      ), 
      24.kheightBox,
      Center(
        child: Obx(() => Visibility(
        visible: controller.isSolutionVisible.value && controller.selectedQuestionIndex.value == questionIndex,
        replacement: const SizedBox.shrink(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              Text(
              'Solution',
              style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w500)),
              8.kheightBox,
              Text(
              solution,
              style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
                ],
              ),
             )
            )
          )
        ),
        16.kheightBox,
          ],
        ),
      ),
    );
 }
}
