import 'dart:developer';

import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/data/models/questions_model.dart';
import 'package:teaching_with_purpose_student/app/data/models/questions_model_data.dart';

class QuestionsController extends GetxController {

  
  Rx<QuestionsModel> questionsModel = QuestionsModel().obs;
  Rx<QuestionsModelData> questionsModelData = QuestionsModelData().obs;
  RxBool isSolutionVisible = false.obs;
  List<String> alphabets = ['A)','B)','C)', 'D)'];

@override
  void onInit() {
    questionsModelData.value = Get.arguments;
    log('question...${questionsModelData.value.question}');
    super.onInit();
  }

  void toggleSolutionVisibility() {
    isSolutionVisible.toggle();
  }

}
