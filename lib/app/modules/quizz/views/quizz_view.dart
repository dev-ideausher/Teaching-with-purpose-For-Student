
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lwp_for_student/app/components/commom_richtext.dart';
import 'package:lwp_for_student/app/components/custom_appbar.dart';
import 'package:lwp_for_student/app/modules/home/controllers/home_controller.dart';
import 'package:lwp_for_student/app/routes/app_pages.dart';
import 'package:lwp_for_student/app/services/colors.dart';
import 'package:lwp_for_student/app/services/dio/endpoints.dart';
import 'package:lwp_for_student/app/services/responsive_size.dart';
import 'package:lwp_for_student/app/services/text_style_util.dart';
import '../controllers/quizz_controller.dart';

class QuizzView extends GetView<QuizzController> {
  const QuizzView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(46.kh),
          child: CustomAppBar(title: 'Live Quizzes', isBack: true)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => Container(
                    decoration: BoxDecoration(
                      color: context.kWhite,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Get.context!.kNeutral,width: 0.5),
                    ),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Select subject',
                        style: TextStyleUtil.kText14_4(
                            fontWeight: FontWeight.w400,
                            color: Get.context!.kLightTextColor),
                      ),
                      items: controller.subjects
                          .map((String item) => DropdownMenuItem<String>(
                              value: item, child: Text(item,style: TextStyleUtil.kText16_5(
                            fontWeight: FontWeight.w400,
                            color: Get.context!.kLightTextColor))))
                          .toList(),
                      value: controller.sub.value,
                      onChanged: (String? value) =>
                          controller.selectSubjects(value!),
                    )),
                  )),
              32.kheightBox,
           SizedBox(
            height: 184.kh,
             child: ListView.separated(
             separatorBuilder: (context, index) => 8.kheightBox, 
             itemCount: Get.find<HomeController>().quizModel.value.data?.length?? 0,
              itemBuilder: (context, index) =>InkWell(
                onTap: ()=> Get.toNamed(Routes.LIVE_QUIZZ),
                child: buildQuizCard(
                      imgPath: Endpoints.temImg, 
                      title:Get.find<HomeController>().quizModel.value.data?[index]?.subject??'',
                      t1: '07 July 2023, Friday at 3:00pm',
                      t2: 'Conducted by ',
                      t3: Get.find<HomeController>().quizModel.value.data?[index]?.conductedBy?.name?? '',
                      t4: 'Topics covered: ',
                      t5: Get.find<HomeController>().quizModel.value.data?[index]?.topicCover?.join(',')??'',
                    ),
              )),
           )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildQuizCard({required String title, required String imgPath, required String t1, required String t2,required String t3, required String t4, required String t5}){
    return SizedBox(
      height: 184.kh,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title,
                style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500)),
            20.kheightBox,
            Row(
              children: [
                Container(
                    width: 55.kw,
                    height: 55.kh,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage(imgPath), fit: BoxFit.fill))),
                24.kwidthBox,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t1,
                        style: TextStyleUtil.kText14_4(
                            fontWeight: FontWeight.w400,
                            color: Get.context!.kLightTextColor),
                      ),
                      8.kheightBox,
                      ReUsableRichText(
                          text1: t2,
                          text2: t3,
                          style1: TextStyleUtil.kText14_4(
                            fontWeight: FontWeight.w400,
                          ),
                          style2: TextStyleUtil.kText14_4(
                              fontWeight: FontWeight.w400,
                              color: Get.context!.kLightTextColor)),
                      16.kheightBox,
                      ReUsableRichText(
                          text1: t4,
                          text2: t5,
                          style1: TextStyleUtil.kText14_4(
                            fontWeight: FontWeight.w400,
                          ),
                          style2: TextStyleUtil.kText14_4(
                              fontWeight: FontWeight.w400,
                              color: Get.context!.kLightTextColor)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
