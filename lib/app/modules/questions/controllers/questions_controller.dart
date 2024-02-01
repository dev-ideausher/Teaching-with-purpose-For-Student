import 'dart:developer';

import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/data/models/questions_model.dart';
import 'package:teaching_with_purpose_student/app/data/models/questions_model_data.dart';
import 'package:teaching_with_purpose_student/app/services/dio/api_service.dart';

import '../../../utils/utils.dart';

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


//-----------------------complete Chapter-------------------------------

Future<void> completeChapter() async {
    var body = {
      "chapter": "65b2188c5f3a80c309a4f352",
      "question": [
        {
          "questionText": "What is 2 + 2?",
          "answer": 4,
          "options": ["3", "4", "5", "6"]
        }
      ]
    };

    try {
      final responce = await APIManager.completeChapter(body: body);
      if (responce.data['status'] == true) {
        log('..${responce.data}');

        Utils.showMySnackbar(desc: 'Chapter completed');
      } else {
        Utils.showMySnackbar(desc: 'Cant complet the chapter');
      }
    } catch (e) {
      log('e**..$e');
    }
  }


}
