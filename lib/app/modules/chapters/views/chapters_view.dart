import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/constants/widget_constants.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';


import '../controllers/chapters_controller.dart';

class ChaptersView extends GetView<ChaptersController> {
  const ChaptersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final data = controller.chapterDetailsModel.value;
    return DefaultTabController(
      initialIndex: controller.selectedTabIndex.value,
      length: 2, 
      child: Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(100.kh),
      child: CustomAppBar(title: data.chapterName?? '', isBack: true,
      bottom: TabBar(
              controller: controller.tabController,
              indicatorWeight: 3,
              indicatorColor: context.kPrimary,
              labelColor: context.kPrimary,
              unselectedLabelColor: context.kLightTextColor,
          tabs: const [
                Tab(text: 'Learn'),
                Tab(text: 'Revise'),
          ]
        ),
    )),
      body:TabBarView(
      controller: controller.tabController,
       children: [
          buildBody(),
          buildBody(),
        ]),
    )
    );
  }

 Widget buildBody(){
 
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 39),
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
          controller.chapterDetailsModel.value.chapterName?? '',
          style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
         4.kheightBox,
          Text(
          'Download PDF’s for the topics you want to study.',
          style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor)),
          16.kheightBox,
          InkWell(
            onTap: (){Get.toNamed(Routes.SELECTED_CHAPTER);},
            child: SizedBox(
              height: 88.kh,
              width: 104.kw,
              child: Stack(
                children: [
                  Center(
                    child:Text(
                    controller.chapterDetailsModel.value.concept?? '',
                    style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Assets.svg.discusionDec.svg(),
                  )
                ],
              ),
            ),
          ), 
        16.kheightBox,
        WidgetsConstants.buildRowWidget(title: 'Assignments', subtitle: 'See all', onTap: (){
          Get.toNamed(Routes.ASSIGNMENTS_LIST);
        })
        ],
      ),
    ),
  );
 }
}
