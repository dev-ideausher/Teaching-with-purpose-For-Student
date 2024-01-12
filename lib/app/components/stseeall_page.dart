import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';

class TapSeeAll extends StatelessWidget {
  const TapSeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    IconData iconData =
        Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Get.context!.kGreyBack,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(iconData, color: Get.context!.kPrimary),
        ),
        title: Text(
          textAlign: TextAlign.center,
          'Events',
          style: TextStyleUtil.kText20_6(fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 56.kh,
                width: 343.kw,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Get.context!.kLightTextColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Select cause',
                        style: TextStyleUtil.kText16_5(
                            fontWeight: FontWeight.w400,
                            color: context.kLightTextColor)
                  ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
