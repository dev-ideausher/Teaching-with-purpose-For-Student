import 'dart:developer';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart'as route;
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;
import 'package:teaching_with_purpose_student/app/data/models/assignments_list_model.dart';
import 'package:teaching_with_purpose_student/app/data/models/upload_file_model.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose_student/app/utils/utils.dart';

class AssignmentController extends GetxController {
  RxBool isLoding = false.obs;
  RxString selectedFile = ''.obs;
  var asnwerController = TextEditingController();
  Rx<UploadFileModel> fileUpload = UploadFileModel().obs;
  Rx<AssignmentsListModelData> assignment = AssignmentsListModelData().obs;

 @override
  void onInit() {
  getArguments();
  super.onInit();
  }



 void getArguments() {
    assignment.value = route.Get.arguments;
  }


 Future<String?> pickFile() async {
  List<String> filePath = await Utils.pickMultipleFilesWithFilter(['pdf','jpg', 'jpeg', 'png']);
  if (filePath.isNotEmpty) {
    String addedFilePath = filePath.first;
    log('Selected  file path: $addedFilePath');
    selectedFile.value = addedFilePath;
    await uploadFile(addedFilePath);
  }
  return null;
}

//-----------------------File upload-------------------------------

  Future<void> uploadFile(String filePath) async {
    final File pickedFile = File(filePath);
    final extension = path.extension(pickedFile.path).replaceAll(".", "").trim();

    final body = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        pickedFile.path,
        contentType: MediaType('application', extension),
        filename: path.basename(pickedFile.path),
      ),
    });

    try {
      final response = await APIManager.uploadFile(body: body);
      if (response.data['status'] == true) {
        log('fileresponce...${response.data}');
        fileUpload.value = UploadFileModel.fromJson(response.data);
        Utils.showMySnackbar(desc: 'File sucessfully added '); 
      }else{
       Utils.showMySnackbar(desc: 'File upload failed. Please try again.'); 
      }
    } catch (e) {
      log("e......$e");
    }
  }


//-----------------------Submit Assignment-------------------------------

 Future<void> submitAssignment() async {
    if (asnwerController.text.isEmpty ) {
      Utils.showMySnackbar(desc: 'Answer required');
      return;
    }
    String? pdfUrl = '';
    String? id = assignment.value.Id;

    if (selectedFile.value.isNotEmpty) {
      await uploadFile(selectedFile.value);
      pdfUrl = fileUpload.value.url;
    }

    var body = {
      "assignmentId": id,
      "answers": asnwerController.text,
      "uploadPdf": pdfUrl
    };

    try {
      final responce = await APIManager.submitAssignment(body: body);

      if (responce.data['status'] == true) {
        log('responce ..${responce.data}');

        Utils.showMySnackbar(desc: 'Submitted successfully');

        route.Get.toNamed(Routes.BOTTOM_NAVBAR);
      } else {
        Utils.showMySnackbar(desc: responce.data['message']);
      }
    } catch (e) {
      log('submittError..$e');
    }
  }

@override
  void onClose() {
  asnwerController.dispose();
  super.onClose();
  }
}
