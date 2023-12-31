import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lwp_for_student/app/components/custom_appbar.dart';
import 'package:lwp_for_student/app/components/custom_textfield.dart';
import 'package:lwp_for_student/app/services/colors.dart';
import 'package:lwp_for_student/app/services/custom_button.dart';
import 'package:lwp_for_student/app/services/responsive_size.dart';
import 'package:lwp_for_student/app/services/text_style_util.dart';
import 'package:lwp_for_student/gen/assets.gen.dart';

import '../controllers/assignment_controller.dart';

class AssignmentView extends GetView<AssignmentController> {
  const AssignmentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize( preferredSize: Size.fromHeight(46.kh),
      child: CustomAppBar(title: 'Assignments', isBack: true)),
      body: Obx(() => controller.isLoding.value?
      Center(child: CircularProgressIndicator(color: context.kPrimary)):
      SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 39),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.assignmentList.value.data?.first?.title?? '',
                style: TextStyleUtil.kText16_5(
                    fontWeight: FontWeight.w500),
              ),
              4.kheightBox,  
              Text(
                controller.assignmentList.value.data?.first?.desc?? '',
                maxLines: 7,
                style: TextStyleUtil.kText16_5(
                    fontWeight: FontWeight.w400,color: context.kLightTextColor),
              ),
            32.kheightBox,
              Text(
                'Your answer',
                style: TextStyleUtil.kText16_5(
                    fontWeight: FontWeight.w500),
              ),
            16.kheightBox,
              StTextField(
                hint: 'Enter Description',
                controller: controller.assignmentAsnwerController,
                minLine: 6,
                maxLines: 8,
              ),
            24.kheightBox,
              Center(
                child: Text(
                  'Or',
                  style: TextStyleUtil.kText16_5(
                      fontWeight: FontWeight.w500),
                ),
              ),
            24.kheightBox,
            buildAddButton(text: 'Upload Assignment', onTap: ()async{
              controller.pickFile();
            }),
            24.kheightBox,
                SizedBox(
                    width: 343.kw,
                    height: 56.kh,
                    child: StButton(title: 'Submit', onTap: (){controller.showLoaderAndSubmit();}))
            ],
          ),
        ),
      ),

      )
    );
  }

Widget buildAddButton({required String text,required void Function() onTap}){
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 56.kh,
      width: 343.kw,
      decoration: BoxDecoration(
        border: Border.all(color: Get.context!.kPrimary),
        borderRadius: BorderRadius.circular(30)
      ),
      child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Assets.svg.upload.svg(height: 20.kh, width: 20.kw),
            8.kwidthBox, 
              Text(
                text,
                style: TextStyleUtil.kText16_5(
                    fontWeight: FontWeight.w500, color: Get.context!.kPrimary),
              ),
            ],
          ),
        ),
    ),
  );
}
}
