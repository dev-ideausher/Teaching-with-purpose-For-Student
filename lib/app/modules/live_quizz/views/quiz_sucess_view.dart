
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:lwp_for_student/app/modules/live_quizz/controllers/live_quizz_controller.dart';
import 'package:lwp_for_student/app/routes/app_pages.dart';
import 'package:lwp_for_student/app/services/colors.dart';
import 'package:lwp_for_student/app/services/custom_button.dart';
import 'package:lwp_for_student/app/services/responsive_size.dart';
import 'package:lwp_for_student/app/services/text_style_util.dart';

class QuizzSucessView extends GetWidget<LiveQuizzController> {
  const QuizzSucessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 96),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 300.kh,
                width: 300.kw,
                child: Lottie.asset(
                    'assets/lottiefiles/Animation - 1696403110794.json'),
              ),
              8.kheightBox,
              Text(
                  textAlign: TextAlign.center,
                  'Congratulations !',
                  style: TextStyleUtil.kText24_6(fontWeight: FontWeight.w600)),
              8.kheightBox,
              Text(
                  textAlign: TextAlign.center,
                  'You scored 10 out of 10 marks. !',
                  style: TextStyleUtil.kText16_5(
                      fontWeight: FontWeight.w400, color: Get.context!.kNeutral)),
              85.kheightBox,
              SizedBox(
                  width: 343.kw,
                  height: 56.kh,
                  child: StButton(title: 'Continue', onTap: ()=> Get.offNamed(Routes.BOTTOM_NAVBAR))),
            ],
          ),
        ),
      ),
    );
  }
}