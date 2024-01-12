import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/modules/subjects/controllers/subjects_controller.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';


import '../controllers/assignment_controller.dart';

class AssignmentListView extends GetView<SubjectsController> {
  const AssignmentListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
      child: CustomAppBar(title: 'English', isBack: true)),
       body:Obx(() => 
       Get.find<AssignmentController>().isLoding.value?
        Center(child: CircularProgressIndicator(color: context.kPrimary)) :
        SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 39),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             InkWell(
              onTap: ()=> Get.toNamed(Routes.ASSIGNMENT),
               child: SizedBox(
                height: 482.kh,
                width: 343.kw,
                child: ListView.separated(
                      separatorBuilder: (context, index) => 8.kheightBox,
                      itemCount: Get.find<AssignmentController>().assignmentList.value.data?.length?? 0,
                      itemBuilder: (context, index) => 
                      SizedBox(
                      height: 90.kh,
                      width: 343.kw,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.svg.editProfile.svg(height: 21.kh,width: 21.kw),
                          16.kwidthBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Get.find<AssignmentController>().assignmentList.value.data?[index]?.title?? '',
                                  maxLines: 1,
                                  style: TextStyleUtil.kText16_5(
                                      fontWeight: FontWeight.w500),
                                ),
                                4.kheightBox,
                                Text(
                                  Get.find<AssignmentController>().assignmentList.value.data?[index]?.desc?? '',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyleUtil.kText14_4(
                                      fontWeight: FontWeight.w400,
                                      color: context.kLightTextColor),
                                ),
                                Text(
                                  Get.find<AssignmentController>().assignmentList.value.data?[index]?.dueDate?? '',
                                  style: TextStyleUtil.kText14_4(
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          103.kwidthBox,
                          Assets.svg.upload.svg(height: 24.kh,width: 24.kw),
                        ],
                      ),
                    ),
                  ),
               ),
             )
            ],
          ),
        ),
      ),)
    );
  }}