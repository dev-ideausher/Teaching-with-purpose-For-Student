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
    return Scaffold(
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(46.kh),
        child: CustomAppBar(title: data.chapterName ?? '', isBack: true)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
            Container(
              height: 37.kh,
              width: 94.kw,
              color: context.kconceptColor,
              child: Center(
                child: Text(
                '1 Concepts',
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
              ),
            ),
            20.kheightBox,
              SizedBox(
                width: double.infinity,
                child: TabBar(
                  controller: controller.tabController,
                  indicatorWeight: 3,
                  indicatorColor: context.kPrimary,
                  labelColor: context.kPrimary,
                  unselectedLabelColor: context.kLightTextColor,
                  tabs: [
                    SizedBox(
                    height: 27.kh,
                    width: 170.kw,
                    child: const Tab(text: 'Learn')),
                    SizedBox(
                      height: 27.kh,
                      width: 170.kw,
                      child: const Tab(text: 'Revise'))
                  ],
                  onTap: (index) {
                    controller.selectedTabIndex.value;
                  },
                ),
              ),
              Expanded(
                child: TabBarView(
                controller: controller.tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                buildBody(),
                 buildBody()
                ],
              ))
            ],
          ),
        ));
  }

Widget buildBody(){
  return Obx(() => SingleChildScrollView(
    physics:const  BouncingScrollPhysics(),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 39),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        controller.selectedTabIndex.value == 0? buildChapter(): buildAssignment()
      ],
      ),
    ),
  ));
}


 Widget buildChapter(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
      'Concepts',
      style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
     4.kheightBox,
      Text(
      'Download PDF’s for the topics you want to study.',
      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor)),
      16.kheightBox,
        GridView.builder(
          shrinkWrap: true,
          itemCount: 6,
          physics:const  NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.846
            ),
            itemBuilder: (context, index) => InkWell(
            onTap: (){Get.toNamed(Routes.SELECTED_CHAPTER);},
            child: Container(
              height: 88.kh,
              width: 104.kw,
              decoration: BoxDecoration(
              color: Get.context!.kWhite,
              borderRadius: BorderRadius.circular(15)),
              child: Stack(
                children: [
                  Center(
                    child: Text(
                        controller.chapterDetailsModel.value.concept ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Assets.svg.smallDarkVersion.svg(),
                  )
                ],
              ),
            ),
          ),
        ),
    32.kheightBox, 
      Text(
      'Video Content',
      style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
      4.kheightBox,    
      Text(
      'Watch video’s for the topics you want to study.',
      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor)),

    ],
  );
 }

Widget buildAssignment() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(
      'Important Questions',
      style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
      4.kheightBox,    
      Text(
      'Choose a topic to view the questions.',
      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor)),
      16.kheightBox,
        GridView.builder(
          shrinkWrap: true,
          itemCount: 6,
          physics:const  NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.846
            ),
            itemBuilder: (context, index) => InkWell(
            onTap: () {
              String? chapterId = controller.chapterId;
              final data = controller.chapterDetailsModel.value;
              Get.toNamed(Routes.REVICE_QUESTIONS,arguments: {
              'chapterId': chapterId,
              'chapterName':data.chapterName,
              'concept':data.concept
            });},
            child: Container(
              height: 88.kh,
              width: 104.kw,
              decoration: BoxDecoration(
              color: Get.context!.kWhite,
              borderRadius: BorderRadius.circular(15)),
              child: Stack(
                children: [
                  Center(
                    child: Text(
                        controller.chapterDetailsModel.value.concept ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Assets.svg.smallDarkVersion.svg(),
                  )
                ],
              ),
            ),
          ),
        ),
      32.kheightBox,
        WidgetsConstants.buildRowWidget(
            title: 'Assignments', subtitle: 'See all', onTap: () {}),
        4.kheightBox,
        Text('Rorem ipsum dolor sit amet, consectetur',
            style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
        16.kheightBox,
        Obx(() => controller.isLoding.value
            ? Center(child: CircularProgressIndicator(color: Get.context!.kPrimary))
            : ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => 8.kheightBox,
              itemCount: controller.assignmentList.value.data?.length ?? 0,
              itemBuilder: (context, index) {
                return WidgetsConstants.showAssignments(
                    title: controller.assignmentList.value.data?[index]?.title ??'',
                    marks:'marks: ${controller.assignmentList.value.data?[index]?.totalMarks ?? ''}',
                    dueDate: controller.assignmentList.value.data?[index]?.dueDate ??'',
                    onTap: () {
                      final data = controller.assignmentList.value.data?[index];
                      Get.toNamed(Routes.ASSIGNMENT, arguments: data);
                    });
              },
            ))
      ],
    );
  }

}
