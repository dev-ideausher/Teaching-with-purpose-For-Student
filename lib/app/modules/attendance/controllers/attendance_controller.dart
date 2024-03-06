import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceController extends GetxController {
  var dateFromController = TextEditingController();
  var  dateToController = TextEditingController();





  @override
  void dispose() {
    dateFromController.dispose();
    dateToController.dispose();
    super.dispose();
  }
}
