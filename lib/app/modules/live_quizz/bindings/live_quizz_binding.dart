import 'package:get/get.dart';

import '../controllers/live_quizz_controller.dart';

class LiveQuizzBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LiveQuizzController>(
      () => LiveQuizzController(),
    );
  }
}
