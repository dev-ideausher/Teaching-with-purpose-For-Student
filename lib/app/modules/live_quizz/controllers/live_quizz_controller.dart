import 'package:get/get.dart';

class LiveQuizzController extends GetxController {
  final RxInt selectedOptionIndex = (-1).obs;

  void selectOption(int index) {
    selectedOptionIndex.value = index;
  }

  List<String> answer = ["Sleep","Sleeping","Slept","Sleeps"];
}
