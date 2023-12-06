import 'package:get/get.dart';

import '../controllers/education_profile_controller.dart';

class EducationProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EducationProfileController>(
      () => EducationProfileController(),
    );
  }
}
