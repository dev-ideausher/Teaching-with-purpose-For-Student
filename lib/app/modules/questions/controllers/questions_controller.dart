import 'dart:developer';

import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/data/models/chapter_questions_model.dart';
import 'package:teaching_with_purpose_student/app/services/dio/api_service.dart';

import '../../../utils/utils.dart';

class QuestionsController extends GetxController {
  RxBool isLoding = false.obs;
  String chapterId = '';
  Rx<ChapterQuestionsModel> questionsModel = ChapterQuestionsModel().obs;
  RxBool isSolutionVisible = false.obs;
  List<String> alphabets = ['A)','B)','C)', 'D)'];

  @override
  void onInit() {
    getArguments();
    super.onInit();
  }

  void getArguments()async{
   final Map<String, dynamic> args = Get.arguments;
   chapterId = args['chapterId'];
   await getQuestions();
  }

  void toggleSolutionVisibility() {
    isSolutionVisible.toggle();
  }

  //-----------------------Questions-------------------------------

  Future<void> getQuestions() async {
    isLoding(true);
    try {
      final response = await APIManager.getQuestion(chapterId:chapterId);
      if (response.data['status'] == true) {
        //log('id from chapter.....$chapterId');
        //log('Questions...${response.data}');
        questionsModel.value = ChapterQuestionsModel.fromJson(response.data);

      } else {
        Utils.showMySnackbar(desc: 'Error while loding question');
      }
    } catch (e) {
      log('error..$e');
    } finally {

      isLoding(false);
    }
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
