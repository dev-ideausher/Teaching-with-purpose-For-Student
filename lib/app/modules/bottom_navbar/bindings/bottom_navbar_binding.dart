import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/modules/home/controllers/home_controller.dart';
import 'package:teaching_with_purpose_student/app/modules/profile/controllers/profile_controller.dart';
import 'package:teaching_with_purpose_student/app/modules/progress/controllers/progress_controller.dart';
import 'package:teaching_with_purpose_student/app/modules/schedule/controllers/schedule_controller.dart';


import '../controllers/bottom_navbar_controller.dart';

class BottomNavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavbarController>(
      () => BottomNavbarController(),
    );
    Get.put<HomeController>(
       HomeController(),
       permanent: true
    );
    Get.lazyPut<ScheduleController>(
      () => ScheduleController(),
    );
    Get.lazyPut<ProgressController>(
      () => ProgressController(),
    );
    Get.put<ProfileController>(
      ProfileController(),
      permanent: true
    );
  }
}
