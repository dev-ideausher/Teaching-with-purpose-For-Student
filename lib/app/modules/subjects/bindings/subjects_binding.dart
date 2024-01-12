import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/modules/assignment/controllers/assignment_controller.dart';

import '../controllers/subjects_controller.dart';

class SubjectsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubjectsController>(
      () => SubjectsController(),
    );
    Get.lazyPut<AssignmentController>(
      () => AssignmentController(),
    );
  
  }
}
