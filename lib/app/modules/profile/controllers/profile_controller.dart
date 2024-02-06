import 'dart:developer';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/data/models/student_model.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose_student/app/services/storage.dart';
import 'package:teaching_with_purpose_student/app/utils/utils.dart';

class ProfileController extends GetxController {
  RxBool isLoding = false.obs;
  StudentModel? studentModel;

  @override
  void onInit() {
    super.onInit();
    getStudent();
  }

  //-----------------------Get Student-------------------------------

  Future<void> getStudent() async {
    isLoding(true);
    try {
      var responce =
          await APIManager.getUser(id: Get.find<GetStorageService>().id);
      if (responce.statusCode == 200) {
        studentModel = StudentModel.fromJson(responce.data);
        Get.find< GetStorageService>().rollNumber = studentModel!.data!.first!.rollNumber.toString();
        // log('profile...${jsonEncode(responce.data)}');
      }
    } catch (e) {
      log('***$e');
    } finally {
      isLoding(false);
    }
  }

//-----------------------App Rating-------------------------------

  Future<void> giveRating(String rating) async {
    try {
      var body = {"rating": rating};

      final responce = await APIManager.giveRating(body: body);

      if (responce.data['status'] == true) {

        //log('rating...${responce.data}');

        Utils.showMySnackbar(title: 'Rating Submitted',desc:'Thankyou for the Rating' );

      } else {
        Utils.showMySnackbar(desc: 'An error occured!');
      }
    } catch (e) {
      log('*.error..$e');
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
