import 'package:get/get.dart';

import '../controllers/exam_score_controller.dart';

class ExamScoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExamScoreController>(
      () => ExamScoreController(),
    );
  }
}
