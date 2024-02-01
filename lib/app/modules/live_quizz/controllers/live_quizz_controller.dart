import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/data/models/quizz_model.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose_student/app/utils/utils.dart';

class LiveQuizzController extends GetxController {
  String? conductedBy = '';
  String? quizInstructions = '';
  String? quizId = '';
  bool quizSubmitted = false;
  
  int? selectedOption;
  RxInt selectedOptionIndex = RxInt(-1);

  List<QuizModelDataQuestion> questions = <QuizModelDataQuestion>[];


  late Timer _timer;
  final RxInt _timerSeconds = 20.obs;

  @override
  void onInit() {
    getArguments();
    super.onInit();
  }

  void getArguments() async {
    final Map<String, dynamic> args = Get.arguments;
    conductedBy = args['conductedBy'];
    quizInstructions = args['instructions'];
    quizId = args['id'];
    questions = args['questions'];
    await startTimer();
  }

  void selectOption(int optionIndex) {
    selectedOption = optionIndex;
    selectedOptionIndex.value = optionIndex;
    log('index..${selectedOptionIndex.value}');
  }

  void showResults() {
    _timer.cancel();
    int correctAnswerNumber = questions[0].answer ?? 0;
    int correctAnswerIndex = correctAnswerNumber - 1;

    bool isCorrect = selectedOption == correctAnswerIndex;

    if (isCorrect) {
      log('answer..$correctAnswerNumber');
    } else {}
  }

  Future<void> startTimer() async {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerSeconds.value > 0) {
        _timerSeconds.value--;
      } else {
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


//-----------------------Submit QuizMark-------------------------------

  Future<void> submitQuizz() async {
    if (quizSubmitted) {
      Utils.showMySnackbar(desc: 'Quiz already submitted');
      return;
    }

    if (selectedOptionIndex.value == -1) {
      Utils.showMySnackbar(desc: 'Please select an answer before submitting.');
      return;
    }

    var body = {
      "quizId": quizId,
      "answers": [selectedOptionIndex.value + 1],
      "duration": 20 - timerSeconds.value,
    };

    try {
      final response = await APIManager.submitQuizz(body: body);

      if (response.statusCode == 200) {
        log('quizzSubmit..${response.data}');

        quizSubmitted = true;
        Get.toNamed(Routes.QUIZZ_SUCESS);
      } else {
        Utils.showMySnackbar(desc: 'Submit failed');
      }
    } catch (e) {
      log('quzzsbmtError..$e');
    }
  }
}

