import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/constants/string_constants.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/custom_button.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import '../controllers/verify_controller.dart';

class VerifyView extends GetView<VerifyController> {
  const VerifyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.context!.kWhite,
      appBar:  PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: '',isBack: true)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  textAlign: TextAlign.center,
                  'Enter Code',
                  style: TextStyleUtil.kText32_6(fontWeight: FontWeight.w600)),
              Text(
                  textAlign: TextAlign.center,
                  'Enter reset Code',
                  style: TextStyleUtil.kText16_5(
                      fontWeight: FontWeight.w400,
                      color: Get.context!.kNeutral)),
              92.kheightBox,
              Text(
                  textAlign: TextAlign.center,
                  'Please enter the verification code send to',
                  style: TextStyleUtil.kText16_5(
                      fontWeight: FontWeight.w400,
                      color: Get.context!.kNeutral)),
              2.5.kheightBox,
              Text(
                  textAlign: TextAlign.center,
                  'leslie.alexander@example.com',
                  style: TextStyleUtil.kText16_5(
                    fontWeight: FontWeight.w400,
                  )),
              20.kheightBox,
              PinCodeTextField(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                autoDisposeControllers: false,
                appContext: context,
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                    selectedFillColor: Get.context!.kPinNotActive,
                    inactiveFillColor: Get.context!.kPinNotActive,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 64.kh,
                    activeColor: Get.context!.kPrimary,
                    inactiveColor: Get.context!.kPinNotActive,
                    fieldWidth: 64.kw,
                    selectedColor: Colors.transparent,
                    activeFillColor: Get.context!.kPinNotActive),
                animationDuration: const Duration(milliseconds: 300),
                keyboardType: TextInputType.number,
                enableActiveFill: true,
                controller: controller.otpController,
                onCompleted: (value) {},
                onChanged: (value) {},
              ),
              16.kheightBox,
              resendTimeWidget(),
              136.kheightBox,
              SizedBox(
                  width: 343.kw,
                  height: 56.kh,
                  child: StButton(
                      title: StringConstants.continueText,
                      onTap: () => Get.toNamed(Routes.CHANGE_PASSWORD))),
            ],
          ),
        ),
      ),
    );
  }



// insted of rich text
  Widget resendTimeWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            textAlign: TextAlign.center,
            'Didn’t get the code?',
            style: TextStyleUtil.kText14_4(
              fontWeight: FontWeight.w400,
            )),
        2.kwidthBox,
        InkWell(
            onTap: () {},
            child: Text(
                textAlign: TextAlign.center,
                'Resend',
                style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500))),
      ],
    );
  }

}
