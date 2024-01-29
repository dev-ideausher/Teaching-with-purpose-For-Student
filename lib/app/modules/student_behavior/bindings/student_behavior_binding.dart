import 'package:get/get.dart';

import '../controllers/student_behavior_controller.dart';

class StudentBehaviorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentBehaviorController>(
      () => StudentBehaviorController(),
    );
  }
}
