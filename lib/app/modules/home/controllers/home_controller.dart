import 'dart:async';
import 'dart:developer';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/data/models/events_model.dart';
import 'package:teaching_with_purpose_student/app/data/models/quizz_model.dart';
import 'package:teaching_with_purpose_student/app/data/models/subjects_list_model.dart';
import 'package:teaching_with_purpose_student/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose_student/app/services/storage.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';

import '../../../utils/utils.dart';
import '../../profile/controllers/profile_controller.dart';


class HomeController extends GetxController {
  RxBool isLoding = false.obs;
  RxBool isAttendanceMarked = false.obs;
  Rx<SubjectsListModel> subjectLists= SubjectsListModel().obs;
  Rx<EventsModel> eventsModel= EventsModel().obs;
  Rx<QuizModel> quizModel = QuizModel().obs;
  RxList<SubjectsListModelData?> subjectItems = <SubjectsListModelData?>[].obs;
  RxString selectedSubject = 'English'.obs;
  final GetStorageService storageService = Get.find<GetStorageService>();
  Rx<DateTime?> lastAttendanceMarkedDate = Rx<DateTime?>(null);
  List<SvgPicture> subjectImages = [
    Assets.svg.maths.svg(),
    Assets.svg.physics.svg(),
    Assets.svg.chemistry.svg(),
    Assets.svg.history.svg(),
    Assets.svg.geography.svg(),
    Assets.svg.biology.svg(),
  ];
  List<String> time = ['Friday, 3:00 pm', 'Friday, 3:00 pm', 'Friday, 3:00 pm'];


  @override
  void onInit() {
    getSubjects();
    super.onInit();
  }

  void checkAttendanceStatus() {
    isAttendanceMarked.value = storageService.isAttendanceMarked;
    lastAttendanceMarkedDate.value = storageService.lastAttendanceMarkedDate;
    if (lastAttendanceMarkedDate.value != null && lastAttendanceMarkedDate.value!.day != DateTime.now().day) {
      isAttendanceMarked.value = false;
    }
  }

  //-----------------------Get-Subjects-------------------------------
  Future<void> getSubjects()async{
    isLoding(true);
    try {
      final responce = await APIManager.getSubjects();
      if (responce.statusCode == 200) {
        // log('subject...${responce.data}');
        subjectLists.value = SubjectsListModel.fromJson(responce.data);
        await showEvents();
        checkAttendanceStatus();
      }
    } catch (e) {
     log('error..$e');
    }finally{
      isLoding(false);
    }
  }

 void updateSubjectItems() {
    subjectItems.assignAll(subjectLists.value.data ?? []);
  }

//-----------------------Get-Events-------------------------------
  Future<void> showEvents()async{
    isLoding(true);
    try {
      final responce = await APIManager.getEvents();
      if (responce.statusCode == 200) {
        // log('events...${responce.data}');
        eventsModel.value = EventsModel.fromJson(responce.data);
       await showQuiz();
      }
    } catch (e) {
     log('error..$e');
    }finally{
      isLoding(false);
    }
  }

  //-----------------------Get-Quizzs-------------------------------
  Future<void> showQuiz()async{
    isLoding(true);
    try {
      final responce = await APIManager.getQuizz();
      if (responce.statusCode == 200) {
        //log('Quizz...${responce.data}');
        quizModel.value = QuizModel.fromJson(responce.data);
      }
    } catch (e) {
     log('error..$e');
    }finally{
      isLoding(false);
    }
  }

//-----------------------Mark-Attendance -------------------------------
  Future<void> markAttendance() async {
    var body = {
      "rollNumber": Get.find<ProfileController>().studentModel?.data?.first?.rollNumber ?? '',
      "isPresent": true
    };

    try {
      final response = await APIManager.markattendance(body: body);
      if (response.data['status'] == true) {
        Utils.showMySnackbar(desc: "Attendance marked");
        isAttendanceMarked.value = true;
        lastAttendanceMarkedDate.value = DateTime.now();
        storageService.isAttendanceMarked = true;
        storageService.lastAttendanceMarkedDate = lastAttendanceMarkedDate.value!;
      } else {
        Utils.showMySnackbar(desc: "Can't mark attendance at the moment");
      }
    } catch (e) {
      log('error..$e');
    }
  }
}
