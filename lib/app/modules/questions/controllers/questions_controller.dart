import 'dart:developer';

import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/data/models/chapter_questions_model.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/dio/api_service.dart';

import '../../../utils/utils.dart';

class QuestionsController extends GetxController {
  RxBool isLoding = false.obs;
  String chapterId = '';
  Rx<ChapterQuestionsModel> questionsModel = ChapterQuestionsModel().obs;
  RxBool isSolutionVisible = false.obs;
  RxInt selectedOptionIndex = (-1).obs;
  RxInt selectedQuestionIndex = (-1).obs;
  RxInt correctAnswerIndex = (-1).obs;

  Map<String, int> userAnswers = {};

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

  void selectOption(int optionIndex, int questionIndex) {
    selectedOptionIndex.value = optionIndex; 
    selectedQuestionIndex.value = questionIndex; 
    isSolutionVisible.value = true; 
    final correctAnswer = questionsModel.value.data?[questionIndex]?.question?.first?.solution;
    correctAnswerIndex.value = questionsModel.value.data?[questionIndex]?.question?.first?.options?.indexOf(correctAnswer) ?? -1;

    final questionId = questionsModel.value.data?[questionIndex]?.Id?? '';
    userAnswers[questionId] = optionIndex;
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


  List<Map<String, dynamic>> prepareChapterCompletionData() {
    List<Map<String, dynamic>> completionData = [];
    userAnswers.forEach((questionId, selectedAnswerIndex) {
      completionData.add({
        "question": questionId,
        "answer": selectedAnswerIndex,
      });
    });
    return completionData;
  }

//-----------------------complete Chapter-------------------------------

Future<void> completeChapter() async {
    var body =  {
      "chapter": chapterId,
      "answers":prepareChapterCompletionData()
    };

    try {
      final responce = await APIManager.completeChapter(body: body);
      if (responce.statusCode == 200 ||responce.statusCode == 201 ) {
      log('..${responce.data}');
      
      Get.toNamed(Routes.BOTTOM_NAVBAR);
      Utils.showMySnackbar(desc: 'Chapter completed');

      } else {
        Utils.showMySnackbar(desc: "Can't complete the chapter");
      }
    } catch (e) {
      log('e**..$e');
    }
  }


}
