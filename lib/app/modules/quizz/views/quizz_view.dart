import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lwp_for_student/app/components/custom_appbar.dart';
import 'package:lwp_for_student/app/components/stcard.dart';
import 'package:lwp_for_student/app/modules/home/controllers/home_controller.dart';
import 'package:lwp_for_student/app/services/colors.dart';
import 'package:lwp_for_student/app/services/responsive_size.dart';
import 'package:lwp_for_student/app/services/text_style_util.dart';
import 'package:lwp_for_student/gen/assets.gen.dart';
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
              itemBuilder: (context, index) =>StCard(
                    title:Get.find<HomeController>().quizModel.value.data?[index]?.subject??'Physics',
                    text1: '07 July 2023, Friday at 3:00pm',
                    text2: 'Conducted by ',
                    imagePath:Get.find<HomeController>().quizModel.value.data?[index]?.image == null ?
                     Image.asset(Assets.images.quizImg1.path,height: 55.kh,width: 55.kw,fit: BoxFit.cover):
                     CachedNetworkImage(imageUrl:Get.find<HomeController>().quizModel.value.data?[index]?.image?? '',height: 55.kh,width: 55.kw, fit: BoxFit.cover),
                    text3:Get.find<HomeController>().quizModel.value.data?[index]?.conductedBy?.name?? 'Esther Howard',
                    text4: 'Topics covered: ',
                    text5: Get.find<HomeController>().quizModel.value.data?[index]?.topicCover?.join(',')??'Electric charge, Friction, Newton’s law of motion',
                    height: 55.kh,
                    width: 55.kw)),
           )
            ],
          ),
        ),
      ),
    );
  }
}
