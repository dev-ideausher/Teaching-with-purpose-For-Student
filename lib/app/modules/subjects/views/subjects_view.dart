import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lwp_for_student/app/components/custom_appbar.dart';
import 'package:lwp_for_student/app/components/custom_textfield.dart';
import 'package:lwp_for_student/app/routes/app_pages.dart';
import 'package:lwp_for_student/app/services/colors.dart';
import 'package:lwp_for_student/app/services/responsive_size.dart';
import 'package:lwp_for_student/app/services/text_style_util.dart';
import 'package:lwp_for_student/gen/assets.gen.dart';
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
           padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 39),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            StTextField(hint: 'Search for courses', 
            controller: controller.searchController,
            prefixIcon: const Icon(Icons.search),
            suffixIcon: const Icon(Icons.arrow_forward),
          ),
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
                  Get.toNamed(Routes.CHAPTERS,arguments: chapter);
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
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Row(
          children: [
         Assets.svg.chapter.svg(height: 24.kh,width: 24.kw),
         15.kwidthBox,
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(
               title,
               style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600),
             ),
             Text(
               concepts,
               style: TextStyleUtil.kText12_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor),
             ),
           ],
         )  
          ],
        ),
      ),
    ),
  );
 }
}

//  {
//                    'chapterName' : chapter?.chapterName,
//                    'concept': chapter?.concept,
                   
//                   }