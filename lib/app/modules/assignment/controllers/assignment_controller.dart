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
  var assignmentAsnwerController = TextEditingController();
  Rx<AssignmentsListModel> assignmentList = AssignmentsListModel().obs;
  Rx<UploadFileModel> fileUpload = UploadFileModel().obs;

@override
  void onInit() {
    listAssignments();
    super.onInit();
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

//-----------------------List-Assignment-------------------------------

Future<void> listAssignments()async{
  isLoding(true);
  try {
    final responce = await APIManager.getAssignment();
      if (responce.data['status'] == true) {
        log('assignment...${responce.data}');
        assignmentList.value = AssignmentsListModel.fromJson(responce.data);
      }
  } catch (e) {
    Utils.showMySnackbar(desc:'$e' );
  }finally{
    isLoding(false);
  }
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



void showLoaderAndSubmit() {
    route.Get.dialog(
      const Center(
        child: CircularProgressIndicator(color: Colors.green),
      ),
    );

    Future.delayed(const Duration(seconds: 2), () {
      route.Get.back();
      Utils.showMySnackbar(desc: 'Assignment submitted successfully');
      route.Get.toNamed(Routes.BOTTOM_NAVBAR);
    });
  }



@override
  void onClose() {
   assignmentAsnwerController.dispose();
    super.onClose();
  }
}
