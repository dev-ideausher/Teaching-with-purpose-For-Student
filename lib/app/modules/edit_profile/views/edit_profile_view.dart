import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/components/custom_textfield.dart';
import 'package:teaching_with_purpose_student/app/constants/image_constant.dart';
import 'package:teaching_with_purpose_student/app/constants/string_constants.dart';
import 'package:teaching_with_purpose_student/app/modules/profile/controllers/profile_controller.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/custom_button.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(46.kh),
            child: CustomAppBar(title: 'Profile', isBack: true)),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                updateProfileImage(),
                32.kheightBox,
                editProfileTextfelds(title: 'Full Name*', hintText: StringConstants.name,
                    controller: controller.nameController.value, readOnly: true),
                editProfileTextfelds(title: 'School', hintText:  StringConstants.schooll,
                    controller: controller.schoolController.value, readOnly: true),
                editProfileTextfelds(title: 'District', hintText: StringConstants.district,
                    controller: controller.districtController.value, readOnly: true),
                editProfileTextfelds(title: 'District Student ID', hintText: StringConstants.districtID,
                    controller: controller.districtIDController.value, readOnly: true),
                editProfileTextfelds( title: 'State Student ID', hintText: StringConstants.stateID,
                    controller: controller.stateIDController.value, readOnly: true),
                editProfileTextfelds(title: 'Email Address', hintText: StringConstants.email,
                    controller: controller.emailController.value, readOnly: true),
                editProfileTextfelds(title: 'Gender',hintText:  StringConstants.gender,
                     controller: controller.genderController.value,readOnly: true),
                editProfileTextfelds(title: 'Age',  hintText: StringConstants.dateOfBirth,
                      controller: controller.dOBController.value, readOnly: true),
                56.kheightBox,
                SizedBox(
                    width: 343.kw,
                    height: 56.kh,
                    child: StButton(title: StringConstants.save, onTap: () {controller.onClick();})),
                16.kheightBox,
                InkWell(
                  onTap: (){},
                  child: Container(
                    height: 56.kh,
                    width: 343.kw,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: context.kGreyBack,
                        border: Border.all(color: context.kRed)),
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        'Deactivite Account',
                        style: TextStyleUtil.kText16_5(
                            fontWeight: FontWeight.w500, color: context.kRed),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  // widget for profile update
  Widget updateProfileImage() {
    return Column(
      children: [
        Stack(
          children: [
            Center(
              child: Obx(() => ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: getProfileImage())),
            ),
            Positioned(
                bottom: 12,
                right: 120,
                child: InkWell(
                    onTap: () {
                      controller.pickImageFromGallery();
                    },
                    child: Assets.svg.addPlus.svg(height: 29.kh, width: 29.kw)))
          ],
        ),
        8.kheightBox,
        Text(
            textAlign: TextAlign.center,
            'Take or upload profile photo',
            style: TextStyleUtil.kText14_4(
                fontWeight: FontWeight.w400,
                color: Get.context!.kLightTextColor))
      ],
    );
  }

// widget for calling textfiels insted of callin one by one
  Widget editProfileTextfelds({ required String title, required String hintText, required TextEditingController controller,bool readOnly = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            textAlign: TextAlign.center,
            title,
            style: TextStyleUtil.kText14_4(
                fontWeight: FontWeight.w500,
                color: Get.context!.kLightTextColor)),
        8.kheightBox,
        StTextField(
            hint: hintText,
            controller: controller,
            textInputType: TextInputType.emailAddress,
            readOnly: readOnly ,
        ),
        24.kheightBox,
      ],
    );
  }

// prrofile image widget
  Widget getProfileImage() {
    if (controller.pickedImagePath.value.isNotEmpty) {
      return Image.file(File(controller.pickedImagePath.value),
          width: 100.kw, height: 100.kh, fit: BoxFit.cover);
    }
    if(Get.find<ProfileController>().studentModel?.data?.first?.image != null){
    return CachedNetworkImage(imageUrl: Get.find<ProfileController>().studentModel?.data?.first?.image ?? '',height: 100.kh,width: 100.kw,fit: BoxFit.cover,);
    }
    return Image.asset(ImageConstant.tempProfileImg,
        height: 100.kh, width: 100.kw, fit: BoxFit.cover);
  }
}
