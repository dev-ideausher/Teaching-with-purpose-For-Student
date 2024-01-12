import 'package:get/get.dart';

class EventsController extends GetxController {
  var selectedValue = 'January'.obs;

  final List<String> items = [
    'January',
    'Febuary',
    'Match',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
    
  ];

  void selectedMonth(String item) {
    selectedValue.value = item;
  }
}
