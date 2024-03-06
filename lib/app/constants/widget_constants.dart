import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';

import '../components/commom_richtext.dart';


class WidgetsConstants{

  static Widget buildUploadButton({required String text,required void Function() onTap}){
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
            Assets.svg.download.svg(height: 20.kh, width: 20.kw),
            8.kwidthBox, 
              Text(
                text,
                style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500, color: Get.context!.kPrimary),
              ),
            ],
          ),
        ),
    ),
  );
}

 static  Widget buildRowWidget({required String title,required String subtitle,required void Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
            title,
            style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
        149.kwidthBox,
        InkWell(
          onTap: onTap,
          child: Text(
              subtitle,
            style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400, color: Get.context!.kPrimary)),
        )
      ],
    );
  }



 static Widget showAssignments({required String title, required String marks, required String dueDate, void Function ()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 90.kh,
        width: 343.kw,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.svg.assignment.svg(height: 21.kh, width: 21.kw),
            16.kwidthBox,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
                  ),
                  4.kheightBox,
                  Text(
                    marks,
                    style: TextStyleUtil.kText14_4(
                        fontWeight: FontWeight.w400,
                        color: Get.context!.kLightTextColor),
                  ),
                  Text(
                    'Due Date: $dueDate',
                    maxLines: 1,
                    style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            103.kwidthBox,
            Assets.svg.upload.svg(height: 24.kh, width: 24.kw),
          ],
        ),
      ),
    );
  }


static Widget customLogoutDialog(
{required BuildContext context,required VoidCallback onNoPressed,required VoidCallback onLogoutPressed,
  }) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      content: Container(
        height: 198.kh,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Get.context!.kWhite,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Confirm Logout',
                  style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
              8.kheightBox,
              Text(
                'Are you sure you want to logout?',
                style: TextStyleUtil.kText14_4(
                    fontWeight: FontWeight.w400,
                    color: Get.context!.kLightTextColor),
              ),
              32.kheightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: onNoPressed,
                    child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Get.context!.kPrimary),
                      ),
                      child: Center(
                        child: Text(
                          'No',
                          style: TextStyleUtil.kText16_5(
                              fontWeight: FontWeight.w500,
                              color: Get.context!.kPrimary),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onLogoutPressed,
                    child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Get.context!.kRed),
                      ),
                      child: Center(
                        child: Text(
                          'Logout',
                          style: TextStyleUtil.kText16_5(
                              fontWeight: FontWeight.w500,
                              color: Get.context!.kRed),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

 // prcentage progress indiacater for marks and all
static Widget percentageIndicater(double percent, String text1, String text2,void Function () onTap) {
  return InkWell(
    onTap: onTap,
    child: SizedBox(
      width: 165.kw,
      height: 122.kh,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Column(
          children: [
            CircularPercentIndicator(
              radius: 30,
              lineWidth: 8,
              progressColor: Get.context!.kPrimary,
              backgroundColor: Get.context!.kLightSkyBlue,
              animation: true,
              percent: percent,
              center: Text( text1,style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
            ),
            8.kheightBox,
            Text( text2, textAlign: TextAlign.center,style: TextStyleUtil.kText12_4(fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    ),
  );
}

//Widget for feedback section by teachers
static Widget feedback(String feebackimg, String teacherName, String statement, String time) {
    return SizedBox(
      height: 79.kh,
      width: 343.kw,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(feebackimg, height: 30.kh, width: 30.kw)),
            12.kwidthBox,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( 
                    teacherName,
                    textAlign: TextAlign.center,style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500)),
                  4.kheightBox,
                  Text( statement, maxLines: 2,
                    style: TextStyleUtil.kText12_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor)),
                ],
              ),
            ),
            32.kwidthBox,
            Text( 
              time,
               maxLines: 1,textAlign: TextAlign.center,
              style: TextStyleUtil.kText12_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor)),
          ],
        ),
      ),
    );
  }

  //widget for key-focus
 static Widget keyFocus(String focusImg, String subject, String area,String performance) {
    return SizedBox(
      width: 343.kw,
      height: 60.kh,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 24, 8),
        child: Row(
          children: [
            Image.asset(focusImg, height: 24.kh, width: 24.kw),
            16.kwidthBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReUsableRichText(
                    text1: subject,
                    text2: area,
                    style1:TextStyleUtil.kText14_4(fontWeight: FontWeight.w600),
                    style2: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600,color: Get.context!.kLightTextColor)),
                8.kheightBox,
                ReUsableRichText(
                    text1: 'Performance : ',
                    text2: performance,
                    style1:TextStyleUtil.kText12_4(fontWeight: FontWeight.w400),
                    style2: TextStyleUtil.kText12_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor)),
              ],
            )
          ],
        ),
      ),
    );  
}
}