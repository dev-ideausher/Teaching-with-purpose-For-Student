import 'dart:developer';

import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/utils/utils.dart';

import '../../../data/models/revice_questionsmodel.dart';
import '../../../services/dio/api_service.dart';

class ReviceQuestionsController extends GetxController {
  RxBool isLoding = false.obs;
  Rx<ReviceQuestionsmodel> revideModel = ReviceQuestionsmodel().obs;
  String chapterId = '';
  String chapterName = '';
  String concept = '';
  RxBool isSolutionVisible = false.obs;
  List<String> alphabets = ['A)','B)','C)', 'D)'];

 @override
  void onInit() {
   getArguments();
    super.onInit();
  }

  void getArguments() async {
    final Map<String, dynamic> args = Get.arguments;
    chapterId = args['chapterId'];
    chapterName = args['chapterName'];
    concept = args['concept'];
    await getReviceQuestions();
  }
  
 
    void toggleSolutionVisibility() {
    isSolutionVisible.toggle();
  }

  //-----------------------Revice-Questions-------------------------------

  Future<void> getReviceQuestions() async {
    isLoding(true);
    try {
      final response = await APIManager.getReviceQuestions(chapterId: chapterId);
      if (response.data['status'] == true) {
        log('Revice-Questions...${response.data}');

        revideModel.value = ReviceQuestionsmodel.fromJson(response.data);
      } else {
        Utils.showMySnackbar(desc: 'Error while loding question');
      }
    } catch (e) {
      log('error..$e');
    } finally {
      isLoding(false);
    }
  }
}
