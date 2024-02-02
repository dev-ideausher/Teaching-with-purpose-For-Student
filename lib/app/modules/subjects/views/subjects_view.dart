

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/components/custom_textfield.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';
import '../controllers/subjects_controller.dart';

class SubjectsView extends GetView<SubjectsController> {
  const SubjectsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String selectedSubjectName = controller.subjectName;
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
      child: CustomAppBar(title: selectedSubjectName, isBack: true)),
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
              height: 37.kh,
              width: 113.kw,
              color: context.kconceptColor,
              child: Center(
              child: Text(
              ' Chapters',
              style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
              ),
              ),
            ),
           40.kheightBox,
            StTextField(hint: 'Search for chapter,concepts...', 
            controller: controller.searchController,
            prefixIcon: const Icon(Icons.search),
            suffixIcon: const Icon(Icons.arrow_forward),
          ),
          32.kheightBox,
          Text(
          'Resume Chapter',
          style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),  
          16.kheightBox,
          Container(
          width: double.infinity,
          height: 192.kh,
          decoration: BoxDecoration(
          image: DecorationImage(
          image: Assets.images.resumeImg.image(
          filterQuality: FilterQuality.high,
          fit: BoxFit.cover).image
        )
      ),
    ),
          8.kheightBox,
          Text(
          'Resume the video from where you left.',
          style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
          32.kheightBox,
          Text(
          'Chapters',
          style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
            16.kheightBox,
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
               separatorBuilder: (context, index) => 8.kheightBox, 
              itemCount: controller.chapterModel.value.data?.length?? 0,
              itemBuilder: (context, index) => buildChaptersWidget(
                title: controller.chapterModel.value.data?[index]?.chapterName?? '',
                concepts: controller.chapterModel.value.data?[index]?.concept?? '',
                onTap: (){
                  final chapter = controller.chapterModel.value.data?[index];
                  String chapterId = controller.chapterModel.value.data?[index]?.Id ?? '';
                  //log('id......$chapterId');
                  Get.toNamed(Routes.CHAPTERS,arguments:{
                    'chapter': chapter,
                    'chapterId': chapterId,
                  });
                }),
              )       
            ],
           ),
         ),
       )
       )
    );
  }


 Widget buildChaptersWidget({required String title,required String concepts, required void Function () onTap}){
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 76.kh,
      width: 343.kw,
      decoration: BoxDecoration(
        color: Get.context!.kWhite,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Row(
          children: [
         Assets.svg.chapter.svg(height: 24.kh,width: 24.kw),
         15.kwidthBox,
         Expanded(
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 title,
                 overflow: TextOverflow.ellipsis,
                 style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600),
               ),
               Text(
                 concepts,
                 overflow: TextOverflow.ellipsis,
                 style: TextStyleUtil.kText12_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor),
               ),
             ],
           ),
         ),
        const Spacer(),
              Text(
                '1 Hrs',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              ),        
          ],
        ),
      ),
    ),
  );
 }
}
