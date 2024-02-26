import 'dart:async';
import 'dart:developer';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/data/models/events_model.dart';
import 'package:teaching_with_purpose_student/app/data/models/quizz_model.dart';
import 'package:teaching_with_purpose_student/app/data/models/subjects_list_model.dart';
import 'package:teaching_with_purpose_student/app/services/dio/api_service.dart';
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

   @override
  void onInit() {
    getSubjects();
    super.onInit();
  }

  List<String> time = ['Friday, 3:00 pm', 'Friday, 3:00 pm', 'Friday, 3:00 pm'];


 List<SvgPicture> subjectImages = [
  Assets.svg.maths.svg(),
  Assets.svg.physics.svg(),
  Assets.svg.chemistry.svg(),
  Assets.svg.history.svg(),
  Assets.svg.geography.svg(),
  Assets.svg.biology.svg()
 ];


  //-----------------------Subjects-------------------------------

  Future<void> getSubjects()async{
    isLoding(true);
    try {
      final responce = await APIManager.getSubjects();
      if (responce.statusCode == 200) {
        // log('subject...${responce.data}');
        subjectLists.value = SubjectsListModel.fromJson(responce.data);
        await showEvents();
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

//-----------------------Events-------------------------------

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

  //-----------------------Quizz-------------------------------
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


//-----------------------Mark Attendance -------------------------------

  Future<void> markAttendance() async {
    var body = {
      "rollNumber":Get.find<ProfileController>().studentModel?.data?.first?.rollNumber ??'',
      "isPresent": true
    };

    try {
      final responce = await APIManager.markattendance(body: body);
      if (responce.data['status'] == true) {
        //log('attendance...${responce.data}');
        Utils.showMySnackbar(desc: "Attendance marked success");
        isAttendanceMarked.value = true;
      } else {
        Utils.showMySnackbar(desc: "Can't mark attaendance at the moment");
      }
    } catch (e) {
      log('error..$e');
    }
  }
}
