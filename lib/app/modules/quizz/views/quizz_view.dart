

import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/commom_richtext.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/data/models/subjects_list_model.dart';
import 'package:teaching_with_purpose_student/app/modules/home/controllers/home_controller.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/dio/endpoints.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
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
           buildSubjectDropdawn(),
           32.kheightBox,
            Obx(() { 
                  final selectedSubject = controller.home.selectedSubject.value;
                  final quizzes = Get.find<HomeController>().quizModel.value.data ?? [];
                  final filteredQuizzes = selectedSubject.isEmpty?
                  quizzes: quizzes.where((quiz) => quiz?.subject == selectedSubject).toList();
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => 8.kheightBox,
                    itemCount: filteredQuizzes.length,
                    itemBuilder: (context, index) {
                      String conductedBy = filteredQuizzes[index]?.conductedBy?.name ?? '';
                      String instructions = filteredQuizzes[index]?.instructions ?? '';
                      String id = Get.find<HomeController>().quizModel.value.data?[index]?.Id?? '';
                      final data = filteredQuizzes[index]?.question;
                      return buildQuizCard(
                        imgPath: Endpoints.temImg,
                        title: filteredQuizzes[index]?.subject ?? '',
                        date: 'Date: ${filteredQuizzes[index]?.date ?? ''}',
                        conducted: conductedBy,
                        t4: '',
                        t5: '',
                        onTap: () {
                          log('onPressed');
                          Get.toNamed(Routes.LIVE_QUIZZ, arguments: {
                            'conductedBy': conductedBy,
                            'instructions': instructions,
                            'id': id,
                            'questions': data,
                          });
                        },
                      );
                    },
                  );
                })
            ],
          ),
        ),
      )
    );
  }

  Widget buildQuizCard({
  required String title, required String imgPath, required String date,required String conducted, required String t4, required String t5, void Function()? onTap}){
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 184.kh,
        width: 343.kw,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500)),
                    4.kheightBox,
                    Text(
                      date,
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor),
                    ),
                    8.kheightBox,
                    ReUsableRichText(
                        text1: 'Conducted by ',
                        style1: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
                        text2: conducted,
                        style2: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor)),
                    16.kheightBox,
                    ReUsableRichText(
                        text1: t4,
                        style1: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
                        text2: t5,
                        style2: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

Widget buildSubjectDropdawn() {
    return Obx(() => Container(
          decoration: BoxDecoration(
              color: Get.context!.kWhite,
              borderRadius: BorderRadius.circular(8)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<SubjectsListModelData?>(
              isExpanded: true,
              hint: Text('Select Subject',
                  style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400)),
              items: controller.home.subjectItems
                  .map((SubjectsListModelData? item) =>
                      DropdownMenuItem<SubjectsListModelData?>(
                        value: item,
                        child: Text(item?.subject ?? '',
                            style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400)),)).toList(),
              value: controller.home.selectedSubject.value == '' ? null
                  : controller.home.subjectItems.firstWhere((SubjectsListModelData? item) =>
                          item?.subject == controller.home.selectedSubject.value),
              onChanged: (SubjectsListModelData? value) {
              log('Selected Subject: ${value?.subject}');
              controller.home.selectedSubject.value = value?.subject ?? ''; 
              },
            ),
          ),
        ));
  }
}
