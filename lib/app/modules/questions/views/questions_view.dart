import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/commom_richtext.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/custom_button.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';

import '../../../services/storage.dart';
import '../controllers/questions_controller.dart';

class QuestionsView extends GetView<QuestionsController> {
  const QuestionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String chapter = Get.find<GetStorageService>().chapter;
    String concept = Get.find<GetStorageService>().concept;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(46.kh),
          child: CustomAppBar(title: chapter, isBack: true)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  color: context.kconceptColor,
                  child: Text(
                    concept,
                    maxLines: 1,
                    style:
                        TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              40.kheightBox,
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => 16.kheightBox,
                itemCount: 1,
                itemBuilder: (context, index) => buildquestion(
                  questions: controller.questionsModelData.value.question ?? '',
                ),
              ),
              Center(
                child: Obx(() => Visibility(
                visible: controller.isSolutionVisible.value,
                replacement: const SizedBox.shrink(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 Text(
                'Solution', 
                style:TextStyleUtil.kText18_6(fontWeight: FontWeight.w500)),
               16.kheightBox,
                 Text(
                controller.questionsModelData.value.solution?? '', 
                style:TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
                ],
                ) 
              ))
            ),
            30.kheightBox,
            SizedBox(
              width: 343.kw,
              height: 56.kh,
              child: StButton(
                title:'Finish', onTap: () {
                Get.toNamed(Routes.BOTTOM_NAVBAR);
              }),
           ),
            ],
          ),
        ),
      ),
    );
  
  }

Widget buildquestion({required String questions,  void Function()? onTap}){
  return SizedBox(
    height: 340.kh,
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
          Text(
          'Questions',
           style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500,color: Get.context!.kLightTextColor),
            ),
        InkWell(
        onTap: (){},
        child: Assets.svg.bookmark.svg(height: 16.kh,width: 16.kw))      
      ]),
     16.kheightBox,
      Text(
      questions,
      style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500)),
    16.kheightBox,
    ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) =>8.kheightBox , 
      itemCount: controller.alphabets.length,
      itemBuilder:(context, index) => SizedBox(
        height: 21.kh,
        width: 300.kw,
        child: ReUsableRichText(
        text1: controller.alphabets[index],
        style1: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500), 
        text2: controller.questionsModelData.value.option?[index]?? '', 
        style2: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500,color: Get.context!.kLightTextColor)
      )
      ),
      
    ), 
    24.kheightBox,
          InkWell(
            onTap: (){
              controller.toggleSolutionVisibility();
            },
            child: Container(
              height: 56.kh,
              width: 343.kw,
              decoration: BoxDecoration(
                  border: Border.all(color: Get.context!.kPrimary),
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  'Solution',
                  style: TextStyleUtil.kText16_5(
                      fontWeight: FontWeight.w500,
                      color: Get.context!.kPrimary),
                ),
              ),
            ),
          ),
      ],
    ),
  );
}
}
