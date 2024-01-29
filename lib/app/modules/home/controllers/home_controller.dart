import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/data/models/events_model.dart';
import 'package:teaching_with_purpose_student/app/data/models/quizz_model.dart';
import 'package:teaching_with_purpose_student/app/data/models/subjects_list_model.dart';
import 'package:teaching_with_purpose_student/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';


class HomeController extends GetxController {
  var searchController = TextEditingController();
  RxBool isLoding = false.obs;
  RxBool isClockIn = true.obs;
  RxString timerText = 'Work Duration: 00:00:00'.obs;
  Rx<DateTime> startTime = DateTime.now().obs;
  Timer? timer;
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


  List<Image> eventImages = [
    Assets.images.football.image(),
    Assets.images.football.image(),
    Assets.images.football.image(),
  ];

 List<SvgPicture> subjectImages = [
  Assets.svg.maths.svg(),
  Assets.svg.physics.svg(),
  Assets.svg.chemistry.svg(),
  Assets.svg.history.svg(),
  Assets.svg.geography.svg(),
  Assets.svg.biology.svg()
 ];


// function for clock attendence
  void toggleClock() {
    if (isClockIn.value) {
      isClockIn.value = false;
      startTime.value = DateTime.now();
      timer = Timer.periodic(const Duration(seconds: 1), (_) {
        final duration = DateTime.now().difference(startTime.value);
        final formattedDuration = _formatDuration(duration);
        timerText.value = 'Work Duration: $formattedDuration';
      });
    } else {
      isClockIn.value = true;
      timer?.cancel();
    }
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours.remainder(24).toString().padLeft(2, '0');
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

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


}
