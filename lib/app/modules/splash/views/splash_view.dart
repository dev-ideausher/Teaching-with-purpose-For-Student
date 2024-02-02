import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         Image.asset(controller.bgImg,fit: BoxFit.cover,height: double.maxFinite,width: double.infinity),
          Center(
            child: Image.asset(
             controller.img,
              width: 343.kw,
              height: 130.kh
            )
          ),
        ],
      ),
    );
  }
}
