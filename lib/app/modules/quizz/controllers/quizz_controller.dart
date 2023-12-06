import 'package:get/get.dart';

class QuizzController extends GetxController {
  var selectedMonth = 'January'.obs;
  var months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',];


  void selectMonth(String month) {
    selectedMonth.value = month;
  }
}
