import 'package:get/get.dart';

import '../controllers/revice_questions_controller.dart';

class ReviceQuestionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviceQuestionsController>(
      () => ReviceQuestionsController(),
    );
  }
}
