
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lwp_for_student/app/services/colors.dart';

class Utils{
  static showMySnackbar({String title = "Notification", required String desc}) {
    Get.snackbar(
      title,
      desc,
      onTap: (snack) {
        Get.closeAllSnackbars();
      },
      isDismissible: true,
      backgroundColor: Get.context!.kPrimary,
      titleText: Text(
        title,
        style: TextStyle(color:Get.context!.kWhite), 
      ),
      messageText: Text(
        desc,
        style: TextStyle(color:Get.context!.kWhite), 
      ),

    );
  } 

  
   
}