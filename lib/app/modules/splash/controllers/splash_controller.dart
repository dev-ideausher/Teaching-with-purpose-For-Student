import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/constants/image_constant.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/dependency_injection.dart';
import 'package:teaching_with_purpose_student/app/services/storage.dart';


class SplashController extends GetxController {

  // RxBool isLogin = false.obs;

  String img = ImageConstant.splashImage;
  String bgImg = ImageConstant.bgImage;

  @override
  void onInit() {
    DependencyInjection.init();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Get.find<GetStorageService>().isLoggedIn==true ? Routes.BOTTOM_NAVBAR: Routes.ON_BOARD);
    });
    super.onInit();
  }
}
