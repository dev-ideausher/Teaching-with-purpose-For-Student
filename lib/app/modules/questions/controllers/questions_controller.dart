import 'dart:developer';

import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/data/models/questions_model.dart';
import 'package:teaching_with_purpose_student/app/data/models/questions_model_data.dart';

class QuestionsController extends GetxController {

  
  Rx<QuestionsModel> questionsModel = QuestionsModel().obs;
  Rx<QuestionsModelData> questionsModelData = QuestionsModelData().obs;

@override
  void onInit() {
    questionsModelData.value = Get.arguments;
    log('question...${questionsModelData.value.question}');
    super.onInit();
  }

 
}
