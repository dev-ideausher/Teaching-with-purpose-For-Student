import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbacksController extends GetxController {
  var  nameController = TextEditingController();
  var  subjectController = TextEditingController();
  var classController = TextEditingController();

  List<String> ratingNumbers = ['1','2','3','4','5'];
}
