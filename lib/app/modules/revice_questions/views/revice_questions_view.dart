import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';

import '../../../../gen/assets.gen.dart';
import '../../../routes/app_pages.dart';
import '../../../services/custom_button.dart';
import '../controllers/revice_questions_controller.dart';

class ReviceQuestionsView extends GetView<ReviceQuestionsController> {
  const ReviceQuestionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(46.kh),
          child: CustomAppBar(title:controller.chapterName, isBack: true)),
      body: Obx(() => controller.isLoding.value?
      Center(child: CircularProgressIndicator(color: context.kPrimary)):
        SingleChildScrollView(
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
                    controller.concept,
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
                itemCount: controller.revideModel.value.data?.length??0,
                itemBuilder: (context, index) => 
                buildquestion(
                  questions: controller.revideModel.value.data?[index]?.question?.first?.questionText?? '',
                  solution: controller.revideModel.value.data?[index]?.question?.first?.solution ??'',
                  questionIndex: index,
                  onTap: (){
                    controller.toggleSolutionVisibility();
                  }
                ),
              ),
            //40.kheightBox,
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
 {required int questionIndex,required String questions,required String solution,void Function()? onTap}){
  return SizedBox(
    height: 490.kh,
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
        child: Container(
          decoration: BoxDecoration(
            color:Get.context!.kLightSkyBlue ,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Assets.svg.bookmark.svg(height: 16.kh,width: 16.kw,
                 color: Get.context!.kBlacklight)))      
      ]
    ),
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
      itemBuilder:(context, index) => 
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 29),
          child: SizedBox(
          width: 300.kw, 
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                controller.alphabets[index],
                 style:TextStyleUtil.kText14_4(fontWeight: FontWeight.w500)),
                 4.kwidthBox,
                Expanded(
                  child: Text(
                  controller.revideModel.value.data?[questionIndex]?.question?.first?.options?[index]?? '',
                  maxLines: 2,
                  style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500,color: Get.context!.kLightTextColor)
                  ),
                ),
                ],
              ),
            ],
          )
                ),
        ),
    ), 
    24.kheightBox,
          Center(
              child: Obx(() => Visibility(
                  visible: controller.isSolutionVisible.value,
                  replacement: const SizedBox.shrink(),
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
                  )))),
          16.kheightBox,
          InkWell(
            onTap: onTap,
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
                      fontWeight: FontWeight.w500,color: Get.context!.kPrimary),
                ),
              ),
            ),
          ),
      ],
    ),
  );
}
}
