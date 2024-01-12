import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/components/custom_textfield.dart';
import 'package:teaching_with_purpose_student/app/constants/string_constants.dart';
import 'package:teaching_with_purpose_student/app/modules/education_profile/controllers/education_profile_controller.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';


class SelectedSubDiscussionScreen extends StatelessWidget {
 SelectedSubDiscussionScreen({Key? key}) : super(key: key);
  final controller = Get.put(EducationProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Biology',isBack: true)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 375.kw,
                  height: 72.kh,
                  child: Row(
                    children: [
                      Assets.images.person.image(height: 40.kh, width: 40.kw),
                      8.kwidthBox,
                      Expanded(
                        child: StTextField(
                          hint: 'Write something',
                          controller: controller.sendTextController,
                          textInputType: TextInputType.emailAddress,
                          suffixIcon:
                              const Icon(Icons.send, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              16.kheightBox,
              messageDisplay(),
              24.kheightBox,
              messageDisplay(),
              24.kheightBox,
              messageDisplay(),
            ],
          ),
        ),
      ),
    );
  }

// widget for  display comments and like for thew discussion
  Widget messageDisplay() {
    return SizedBox(
      height: 216.kh,
      width: 360.kw,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.kh,
              width: 344.kw,
              child: Row(
                children: [
                  Assets.images.profileimg.image(),
                  12.kwidthBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        'Jane Cooper',
                        style: TextStyleUtil.kText14_4(
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        '6h ago',
                        style: TextStyleUtil.kText14_4(
                            fontWeight: FontWeight.w400,
                            color: Get.context!.kLightTextColor),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.more_vert),
                ],
              ),
            ),
            16.kheightBox,
            Text(
              textAlign: TextAlign.left,
              StringConstants.dicsussionText,
              style: TextStyleUtil.kText14_4(
                  fontWeight: FontWeight.w400,
                  color: Get.context!.kLightTextColor),
            ),
            16.kheightBox,
            Row(
              children: [
                Assets.svg.like.svg(),
                Text(
                  textAlign: TextAlign.center,
                  '50 likes',
                  style: TextStyleUtil.kText14_4(
                      fontWeight: FontWeight.w400,
                      color: Get.context!.kLightTextColor),
                ),
                const Spacer(),
                Assets.svg.comment.svg(),
                Text(
                  textAlign: TextAlign.center,
                  '2 comments',
                  style: TextStyleUtil.kText14_4(
                      fontWeight: FontWeight.w400,
                      color: Get.context!.kLightTextColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}
