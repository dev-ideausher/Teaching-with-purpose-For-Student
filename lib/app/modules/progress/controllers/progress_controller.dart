import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lwp_for_student/gen/assets.gen.dart';

class ProgressController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var selectedTabIndex = 0.obs;
  final selectedSubjectIndex = 0.obs;

  List<SvgGenImage> subjectImage = [
    Assets.svg.allSubjects,
    Assets.svg.maths,
    Assets.svg.physicsRed,
    Assets.svg.chemistry,
    Assets.svg.history,
    Assets.svg.geography,
    Assets.svg.biology,
  ];

  List<String> subjectText = [
    'All Subjects',
    'Mathematics',
    'Physics',
    'chemistry',
    'History',
    'Geography',
    'biology',
  ];

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    tabController
        .addListener(() => selectedTabIndex.value = tabController.index);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
