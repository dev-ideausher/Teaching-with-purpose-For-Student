
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/modules/home/controllers/home_controller.dart';

class QuizzController extends GetxController {

  final home = Get.find<HomeController>();

  @override
  void onInit() {
    initilizeSubjects();
    super.onInit();
  }

  void initilizeSubjects(){
    home.updateSubjectItems();
  }
}


    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   initilizeSubjects();
    // });