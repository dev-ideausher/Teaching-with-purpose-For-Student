import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/components/custom_textfield.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';


import '../controllers/attendance_controller.dart';

class AttendanceView extends GetView<AttendanceController> {
  const AttendanceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'My Attendance',isBack: true)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textAlign: TextAlign.center,
                'Select Date Range',
                style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
              ),
              16.kheightBox,
              Row(
                children: [
                  Expanded(
                    child: StTextField(
                      textInputType: TextInputType.datetime,
                      suffixIcon: Icon(
                        Icons.calendar_month_rounded,
                        color: context.kPrimary,
                      ),
                      hint: 'Select date',
                      controller: controller.fromController,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'to',
                    style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                    child: StTextField(
                      textInputType: TextInputType.datetime,
                      hint: 'Select date',
                      controller: controller.toController,
                      suffixIcon: Icon(
                        Icons.calendar_month_rounded,
                        color: context.kPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              32.kheightBox,
              Text(
                textAlign: TextAlign.center,
                'Attendance',
                style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
              ),
              16.kheightBox,
              attendenceRegister(
                  'July 16th,2023', Assets.images.present.image()),
              8.kheightBox,
              attendenceRegister(
                  'July 15th,2023', Assets.images.present.image()),
              8.kheightBox,
              attendenceRegister(
                  'July 14th,2023', Assets.images.present.image()),
              8.kheightBox,
              attendenceRegister(
                  'July 13th,2023', Assets.images.abcent.image()),
              8.kheightBox,
              attendenceRegister(
                  'July 12th,2023', Assets.images.present.image()),
              8.kheightBox,
              attendenceRegister(
                  'July 11th,2023', Assets.images.present.image()),
              8.kheightBox,
              attendenceRegister(
                  'July 10th,2023', Assets.images.abcent.image()),
              attendenceRegister(
                  'July  9th,2023', Assets.images.present.image()),
              8.kheightBox,
              attendenceRegister(
                  'July  8th,2023', Assets.images.present.image()),
            ],
          ),
        ),
      ),
    );
  }

//
  Widget attendenceRegister(String dateText, Image image) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Get.context!.kWhite,
      ),
      height: 64.kh,
      width: 343.kw,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Row(
          children: [
            Text(
              textAlign: TextAlign.center,
              dateText,
              style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
            ),
            162.kwidthBox,
            image,
          ],
        ),
      ),
    );
  }
}
