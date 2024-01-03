
import 'dart:developer';
import 'package:get/get.dart';
import 'package:lwp_for_student/app/data/models/exam_sheet_model.dart';
import 'package:lwp_for_student/app/services/dio/api_service.dart';
import 'package:lwp_for_student/app/utils/utils.dart';

class ScheduleController extends GetxController {
  var selectedIndex = 0.obs;
  RxBool isLoding = false.obs;
  Rx<ExamSheetModel> examsheetmodel= ExamSheetModel().obs;

  @override
  void onInit() {
   examSheet();
    super.onInit();
  }
 
  void selectDay(int index) {
    selectedIndex.value = index;
  }


//-----------------------Exam Sheet-------------------------------

  Future<void> examSheet()async{
    isLoding(true);
    try {
      final responce = await APIManager.getExamSheet();
      if (responce.data['status'] == true) {
        // log('examSheet...${responce.data}');
      examsheetmodel.value = ExamSheetModel.fromJson(responce.data);
      }else{
        Utils.showMySnackbar(desc: 'something went wrong');
      }
    } catch (e) {
     log('error..$e');
    }finally{
      isLoding(false);
    }
  }

//-----------------------Time table-------------------------------

}
