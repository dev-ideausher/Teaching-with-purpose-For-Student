import 'package:get/get.dart';

import '../controllers/edit_assignment_controller.dart';

class EditAssignmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditAssignmentController>(
      () => EditAssignmentController(),
    );
  }
}
