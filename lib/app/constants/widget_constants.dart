import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';


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
            Assets.svg.editProfile.svg(height: 21.kh, width: 21.kw),
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
                    dueDate,
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
}