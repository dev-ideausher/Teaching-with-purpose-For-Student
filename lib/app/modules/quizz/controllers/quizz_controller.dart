import 'package:get/get.dart';

class QuizzController extends GetxController {
  var sub = 'Physics'.obs;
  final List<String> subjects = [
    'Physics',
    'English',
    'Mathematics',
    'Chemistry',
    'Biology',
    'history',
    'Geography'
  ];


  void selectSubjects(String subjects) {
    sub.value = subjects;
  }
}
