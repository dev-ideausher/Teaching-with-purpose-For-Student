
import 'dart:developer';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/data/models/student_model.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose_student/app/services/storage.dart';

class ProfileController extends GetxController {
  RxBool isLoding = false.obs;
  StudentModel? studentModel;

 @override
  void onInit() {
    super.onInit();
    getStudent();
  }

 
 //-----------------------Get Student-------------------------------

Future<void> getStudent()async{
  isLoding(true);
  try {
    var responce = await APIManager.getUser(id: Get.find<GetStorageService>().id);
    if(responce.statusCode == 200){
    studentModel = StudentModel.fromJson(responce.data);
    // log('profile...${jsonEncode(responce.data)}');
    }
  } catch (e) {
    log('***$e');
  }finally{
    isLoding(false);
  }
}

//logout 
  logout() async {
    try {
      Get.find<GetStorageService>().logout();
      await Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      e.toString();
    }
  }
  
}
