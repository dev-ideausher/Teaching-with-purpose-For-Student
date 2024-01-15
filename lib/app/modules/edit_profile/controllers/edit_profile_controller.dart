import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'as route;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

import 'package:path/path.dart' as path;

import 'package:intl/intl.dart';
import 'package:teaching_with_purpose_student/app/data/models/student_update_model.dart';
import 'package:teaching_with_purpose_student/app/data/models/upload_file_model.dart';
import 'package:teaching_with_purpose_student/app/modules/profile/controllers/profile_controller.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose_student/app/services/storage.dart';
import 'package:teaching_with_purpose_student/app/utils/utils.dart';


class EditProfileController extends GetxController {
  var nameController = TextEditingController().obs;
  var schoolController = TextEditingController().obs;
  var districtController = TextEditingController().obs;
  var districtIDController = TextEditingController().obs;
  var stateIDController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var genderController = TextEditingController().obs;
  var dOBController = TextEditingController().obs;

  RxString pickedImagePath = ''.obs;
  RxString selectedDate = ''.obs;
  UploadFileModel? uploadFileModel;
  Rx<StudentUpdateModel> updateData= StudentUpdateModel().obs;

  @override
  void onInit() {
    nameController.value.value = TextEditingValue(text: Get.find<ProfileController>().studentModel?.data?.first?.name?? '');
    schoolController.value.value = TextEditingValue(text: Get.find<ProfileController>().studentModel?.data?.first?.school?? '');
    districtController.value.value = TextEditingValue(text:  Get.find<ProfileController>().studentModel?.data?.first?.district?? '');
    districtIDController.value.value = TextEditingValue(text:  Get.find<ProfileController>().studentModel?.data?.first?.districtStudentID?? '');
    stateIDController.value.value = TextEditingValue(text:  Get.find<ProfileController>().studentModel?.data?.first?.stateStudentID?? '');
    genderController.value.value = TextEditingValue(text:  Get.find<ProfileController>().studentModel?.data?.first?.gender?? '');
    emailController.value.value = TextEditingValue(text:  Get.find<ProfileController>().studentModel?.data?.first?.email?? '');
    dOBController.value.value = const TextEditingValue(text: '24-10-1998');
    super.onInit();
  }

  Future<void>onClick()async{
    if(pickedImagePath.isNotEmpty){
      await uploadImage();
    }else{
      updateProfile();
    }
  }

  //-----------------------Upload File-------------------------------
    Future<void> uploadImage() async {
    final File pickedImageFile = File(pickedImagePath.value);
    String extension = path.extension(pickedImageFile.path).replaceAll(".", "");

    final body = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        pickedImageFile.path,
        contentType: MediaType('application', extension),
        filename: path.basename(pickedImageFile.path),
      )});
    try {
       final responce = await APIManager.uploadFile(body: body);
       if(responce.data['status'] == true){
        uploadFileModel =  UploadFileModel.fromJson(responce.data);
        log('uploadFileModel....${uploadFileModel!.url}');
        updateProfile();
       }
    } catch (e) {
      log("$e");
    } 
  }

 //-----------------------update Profile-------------------------------
  Future<void> updateProfile() async {  
  var body = {
    "name" : nameController.value.text,
    "Image": uploadFileModel?.url,
    "gender": genderController.value.text,
    "dob": dOBController.value.text
  };
  log('$body');
  log(Get.find<GetStorageService>().id.toString());
    try {
      final responce = await APIManager.updateUser( body: body, id: Get.find<GetStorageService>().id);
      if (responce.statusCode == 200) {
      updateData.value = StudentUpdateModel.fromJson(responce.data);
      log('student..${responce.data}');
      Utils.showMySnackbar(  title: 'Sucess' ,desc: 'Profile updated Successfully');
      Get.find<ProfileController>().getStudent();
      Get.toNamed(Routes.BOTTOM_NAVBAR);
      }else{
        Utils.showMySnackbar(desc: responce.data['message']);
      }
    } catch (e) {
      log('***$e');
    }
  }

   //-----------------------Image from gallery-------------------------------

  Future<void> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      pickedImagePath.value = image!.path;
      log("pickedImage path ${pickedImagePath.value}");
    } catch (e) {
      throw Exception(e);
    }
  }

  //-----------------------Date Picker -------------------------------
   void chooseDate(BuildContext context) async {
    final datePicker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 100)),
      lastDate: DateTime.now(),
    );
    if (datePicker == null) {
      return;
    } else {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      selectedDate.value = formatter.format(datePicker);
      dOBController.value.text = selectedDate.value;
    }
  } 

  @override
  void onClose() {
    nameController.value.dispose();
    schoolController.value.dispose();
    districtController.value.dispose();
    districtIDController.value.dispose();
    stateIDController.value.dispose();
    emailController.value.dispose();
    genderController.value.dispose();
    dOBController.value.dispose();
    super.onClose();
  }
}  