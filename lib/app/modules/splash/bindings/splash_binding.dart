import 'package:get/get.dart';
import 'package:lwp_for_student/app/services/global_data.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
    
    Get.lazyPut<GlobalData>(
    () => GlobalData(),
    );
  }

}
