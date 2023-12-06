import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lwp_for_student/app/services/responsive_size.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
         controller.img,
          width: 343.kw,
          height: 130.kh)
      ),
    );
  }
}
