import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/dio/api_service.dart';

import '../../../utils/utils.dart';

class FeedbacksController extends GetxController {
  var  nameController = TextEditingController();
  var  subjectController = TextEditingController();
  var classController = TextEditingController();

  List<String> ratingNumbers = ['1','2','3','4','5'];

  RxList<String> selectedRatings = <String>['', '', '', '', ''].obs;


  void changeRating(int questionIndex, String rating) {
    selectedRatings[questionIndex] = rating;
    log('Rating changed for question $questionIndex: $rating');
  }



//-----------------------Send feedback-------------------------------

Future<void> sendFeedbacks() async {
    if (nameController.text.isEmpty ||subjectController.text.isEmpty || classController.text.isEmpty) {
      Utils.showMySnackbar(desc: 'Please fill the fields');
      return;
    }

    try {
      var body = {
        "TeacherName": nameController.text,
        "subject": subjectController.text,
        "classes": classController.text,
        "generalState": selectedRatings[0],
        "courseContent": selectedRatings[1],
        "visualConnectivity": selectedRatings[2],
        "coordinate": selectedRatings[3],
        "learningMaterial": selectedRatings[4],
        "desc": "The class was informative and engaging."
      };

      log('body..$body');

      final responce = await APIManager.sendFeedback(body: body);

      if (responce.data['status'] == true) {

        Get.toNamed(Routes.BOTTOM_NAVBAR);

        Utils.showMySnackbar(desc: 'Feedback added Success');
      } else {
        Utils.showMySnackbar(desc: responce.data['message']);
      }
    } catch (e) {
      log('*...$e');
    }
  }


@override
  void onClose() {
  nameController.dispose() ;
  subjectController.dispose() ;
  classController.dispose() ;
  super.onClose();
  }
}
