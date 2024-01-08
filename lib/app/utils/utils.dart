
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lwp_for_student/app/services/colors.dart';
import 'package:lwp_for_student/app/services/responsive_size.dart';
import 'package:lwp_for_student/app/services/text_style_util.dart';
import 'package:lwp_for_student/gen/assets.gen.dart';

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

  static Future<List<String>> pickMultipleFilesWithFilter(List<String> allowedExtensions) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: allowedExtensions,
      );

      if (result != null) {
        return result.paths.map((path) => path!).toList();
      } else {
        return [];
      }
    } catch (e) {
      print('Error picking multiple files: $e');
      return [];
    }
  } 


  static Widget buildUploadButton({required String text,required void Function() onTap}){
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 56.kh,
      width: 343.kw,
      decoration: BoxDecoration(
        border: Border.all(color: Get.context!.kPrimary),
        borderRadius: BorderRadius.circular(30)
      ),
      child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Assets.svg.upload.svg(height: 20.kh, width: 20.kw),
            8.kwidthBox, 
              Text(
                text,
                style: TextStyleUtil.kText16_5(
                    fontWeight: FontWeight.w500, color: Get.context!.kPrimary),
              ),
            ],
          ),
        ),
    ),
  );
}
   
}