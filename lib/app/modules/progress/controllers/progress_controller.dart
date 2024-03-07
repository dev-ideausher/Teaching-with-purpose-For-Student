import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/data/models/course_completion_model.dart';
import 'package:teaching_with_purpose_student/app/data/models/student_performance_model.dart';
import 'package:teaching_with_purpose_student/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose_student/app/services/storage.dart';
import 'package:teaching_with_purpose_student/app/utils/utils.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';

class ProgressController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var selectedTabIndex = 0.obs;
  final selectedSubjectIndex = 0.obs;
  RxBool isLoading = false.obs;
  var selectedExamType = 'yearly'.obs;
  String? subjectId = '';
  Rx<StudentPerformanceModel> performanceModel = StudentPerformanceModel().obs;
  Rx<CourseCompletionModel> courseCompletion = CourseCompletionModel().obs;


  List<SvgGenImage> subjectImage = [
    Assets.svg.allSubjects,
    Assets.svg.maths,
    Assets.svg.physicsRed,
    Assets.svg.chemistry,
    Assets.svg.history,
    Assets.svg.geography,
    Assets.svg.biology,
  ];


  @override
  void onInit() {
    initilize();
    super.onInit();
  }

  void initilize()async{
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      selectedTabIndex.value = tabController.index;
    });
    await getPerformance();
  }

  //-----------------------Performance-------------------------------

 Future<void> getPerformance({String? selectedSubjectId}) async {
    isLoading(true);
    try {
      final responce = await APIManager.getPerformance(resultType: selectedExamType.value, subject: selectedSubjectId);
      if (responce.data['status'] == true) {
        performanceModel.value = StudentPerformanceModel.fromJson(responce.data);
        //log('Performance data...${responce.data}');
        await courseCompletionTracking();
      } else {
        Utils.showMySnackbar(desc: 'Something went wrong');
      }
    } catch (e) {
      log('e...**$e');
    } finally {
      isLoading(false);
    }
  }

 //-----------------------Course-completion-------------------------------
 
  Future<void> courseCompletionTracking({String? selectedSub}) async {
    isLoading(true);
    String studentId = Get.find<GetStorageService>().id;
    try {
      final responce = await APIManager.getCourseCompletion(studentId: studentId,subject: selectedSub);
      if (responce.data['status'] == true) {
        courseCompletion.value = CourseCompletionModel.fromJson(responce.data);
        //log('Course completion data...${responce.data}');
      } else {
        Utils.showMySnackbar(desc: 'Something went wrong');
      }
    } catch (e) {
       log('e...**$e');
    } finally {
      isLoading(false);
    }
  }


  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}


  // List<String> subjectText = [
  //   'All Subjects',
  //   'Mathematics',
  //   'Physics',
  //   'chemistry',
  //   'History',
  //   'Geography',
  //   'biology',
  // ];