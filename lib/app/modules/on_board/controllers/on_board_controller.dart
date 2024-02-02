import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';


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


double calculateDotWidth(int index) {
    return index == pageCount.value ? 14.kw : 10.kw;
  }

  double calculateDotHeight(int index) {
    return index == pageCount.value ? 14.kh : 10.kh;
  }

  onDotClicked(int index) {
    pageCount.value = index;
    pageController.jumpToPage(pageCount.value);
  }

}
