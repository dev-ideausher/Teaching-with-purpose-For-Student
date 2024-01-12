import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';


class OnBoardController extends GetxController {
  PageController pageController = PageController();

  RxInt pageCount = 0.obs;

  onTapNext() {
    if (pageCount.value != 2) {
      pageCount.value++;
      pageController.jumpToPage(pageCount.value);
    } else {
      Get.offNamed(Routes.GET_STARTED);
    }
  }

  onDotClicked(int index) {
    pageCount.value = index;
    pageController.jumpToPage(pageCount.value);
  }

}
