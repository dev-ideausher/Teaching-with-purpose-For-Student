import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lwp_for_student/app/data/models/questions_model.dart';
import 'package:lwp_for_student/app/services/dio/api_service.dart';
import 'package:lwp_for_student/app/services/global_data.dart';
import 'package:lwp_for_student/app/utils/utils.dart';

class ChaptersController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var selectedTabIndex = 0.obs;
  RxBool isLoding = false.obs;
  Rx<QuestionsModel> questionsModel = QuestionsModel().obs;
  String chapterName = '';
  String concept = '';


  @override
  void onInit() {
   tabView();
    super.onInit();
  }

  void tabView()async{
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() => selectedTabIndex.value = tabController.index);
    final Map<String, dynamic> arguments = Get.arguments;
    chapterName = arguments['chapterName'];
    concept = arguments['concept'];
    await getQuestions();

  }


  //-----------------------Questions-------------------------------

  Future<void> getQuestions() async {
    isLoding(true);
    try {
      final response = await APIManager.getQuestion(chapterId: Get.find<GlobalData>().id);
      if (response.data['status'] == true) {

        log('Questions...${response.data}');

        questionsModel.value = QuestionsModel.fromJson(response.data);

      } else {
        Utils.showMySnackbar(desc: response.data['message']);
      }
    } catch (e) {

      log('error..$e');

    } finally {

      isLoding(false);
    }
  }



  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
