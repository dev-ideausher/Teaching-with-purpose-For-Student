import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/data/models/quizz_model.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';

class LiveQuizzController extends GetxController {
  String? conductedBy = '';
  String? quizInstructions = '';
  int? selectedOption;
  List<QuizModelDataQuestion> questions = <QuizModelDataQuestion>[];

  late Timer _timer;
  final RxInt _timerSeconds = 20.obs;

  @override
  void onInit() {
    getArguments();
    super.onInit();
  }

  void getArguments() async{
    final Map<String, dynamic> args = Get.arguments;
    conductedBy = args['conductedBy'];
    quizInstructions = args['instructions'];
    questions = args['questions'];
     await startTimer();
  }


 Future <void> startTimer()async {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerSeconds.value > 0) {
        _timerSeconds.value--;
      } else {
        showTimeoutDialog();
        timer.cancel();
      }
    });
  }

  void resetTimer() {
    _timer.cancel();
    _timerSeconds.value = 20;
    startTimer();
  }

  RxInt get timerSeconds => _timerSeconds;


  void selectOption(int optionIndex) {
    selectedOption = optionIndex;
    update();
  }


  void showResults() {
    _timer.cancel();
    int correctAnswerNumber = questions[0].answer ?? 0;
    int correctAnswerIndex = correctAnswerNumber - 1;

    bool isCorrect = selectedOption == correctAnswerIndex;

    if (isCorrect) {
      Get.toNamed(Routes.QUIZZ_SUCESS);
    } else {}
  }


  void showTimeoutDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Time Out'),
        content:
            const Text('You did not select an answer within the given time.'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();

              Get.offNamed(Routes.BOTTOM_NAVBAR);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }


//-----------------------Submit Mark-------------------------------
}
