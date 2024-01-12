import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/stcustom_icon.dart';
import 'package:teaching_with_purpose_student/app/constants/string_constants.dart';
import 'package:teaching_with_purpose_student/app/modules/home/views/home_view.dart';
import 'package:teaching_with_purpose_student/app/modules/profile/views/profile_view.dart';
import 'package:teaching_with_purpose_student/app/modules/progress/views/progress_view.dart';
import 'package:teaching_with_purpose_student/app/modules/schedule/views/schedule_view.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';

import '../controllers/bottom_navbar_controller.dart';

class BottomNavbarView extends GetView<BottomNavbarController> {
  const BottomNavbarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return IndexedStack(
            index: controller.currentIndex.value, children: tabViews());
      }),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) => controller.chnageIndex(index),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Get.context!.kPrimary,
          selectedFontSize: 12.kh,
          unselectedFontSize: 12.kh,
          backgroundColor: Get.context!.kWhite,
          unselectedItemColor: Get.context!.kBottomNavgrey,
          items: _buildBottomNavBarItems())),
    );
  }

  List<Widget> tabViews() {
    return const [HomeView(), ScheduleView(), ProgressView(), ProfileView()];
  }

  List<BottomNavigationBarItem> _buildBottomNavBarItems() {
    return [
      _buildBottomNavBarItem(
          imgPath: Assets.svg.home, index: 0, label: StringConstants.home),
      _buildBottomNavBarItem(
          imgPath: Assets.svg.schedule,
          index: 1,
          label: StringConstants.schedule),
      _buildBottomNavBarItem(
          imgPath: Assets.svg.progress,
          index: 2,
          label: StringConstants.progress),
      _buildBottomNavBarItem(
          imgPath: Assets.svg.person, index: 3, label: StringConstants.profile),
    ];
  }

  BottomNavigationBarItem _buildBottomNavBarItem(
      {required SvgGenImage imgPath,
      required int index,
      required String label}) {
    return BottomNavigationBarItem(
      icon: StIcon(
        svgImg: imgPath,
        color: controller.currentIndex.value == index
            ? Get.context!.kPrimary
            : Get.context!.kBottomNavgrey,
      ),
      label: label,
    );
  }
}
