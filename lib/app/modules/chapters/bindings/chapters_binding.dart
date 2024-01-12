import 'package:get/get.dart';

import '../controllers/chapters_controller.dart';

class ChaptersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChaptersController>(
      () => ChaptersController(),
    );
  }
}
