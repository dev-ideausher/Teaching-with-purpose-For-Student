import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/components/custom_textfield.dart';
import 'package:teaching_with_purpose_student/app/constants/string_constants.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/custom_button.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_student/app/utils/validation.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Get.context!.kWhite,
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: '',isBack: true)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  textAlign: TextAlign.center,
                  'Forgot Password',
                  style: TextStyleUtil.kText32_6(fontWeight: FontWeight.w600)),
              Text(
                  textAlign: TextAlign.center,
                  'Enter registered E-mail ID',
                  style: TextStyleUtil.kText16_5(
                      fontWeight: FontWeight.w400, color: Get.context!.kNeutral)),
              92.kheightBox,
              Text(
                  textAlign: TextAlign.center,
                  'We will send a verification code to your registered E-mail Id',
                  style: TextStyleUtil.kText16_5(
                      fontWeight: FontWeight.w400, color: Get.context!.kNeutral)),
              40.kheightBox,
              StTextField(
                  hint: StringConstants.emailText,
                  controller: controller.forgotPasswordController,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) => !isValidEmail(value, isRequired: true)
                      ? 'Please enter a valid  Email': null),
              184.kheightBox,
              SizedBox(
                width: 343.kw,
                height: 56.kh,
                child:StButton(title: StringConstants.continueText,onTap: () => Get.toNamed(Routes.VERIFY)),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
