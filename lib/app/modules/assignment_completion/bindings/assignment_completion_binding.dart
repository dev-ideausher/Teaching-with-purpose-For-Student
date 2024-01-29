import 'package:get/get.dart';

import '../controllers/assignment_completion_controller.dart';

class AssignmentCompletionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssignmentCompletionController>(
      () => AssignmentCompletionController(),
    );
  }
}
