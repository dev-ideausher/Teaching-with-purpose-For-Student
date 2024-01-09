import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lwp_for_student/app/data/models/chapters_model_data.dart';
import 'package:lwp_for_student/app/data/models/questions_model.dart';
import 'package:lwp_for_student/app/data/models/questions_model_data.dart';
import 'package:lwp_for_student/app/services/dio/api_service.dart';
import 'package:lwp_for_student/app/services/global_data.dart';
import 'package:lwp_for_student/app/utils/utils.dart';
import 'package:video_player/video_player.dart';

class ChaptersController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var selectedTabIndex = 0.obs;
  RxBool isLoding = false.obs;
  String chapterName = '';
  String concept = '';
  Rx<QuestionsModel> questionsModel = QuestionsModel().obs;
  Rx<QuestionsModelData> questionsModelData = QuestionsModelData().obs;
  Rx<ChaptersModelData> chapterDetailsModel = ChaptersModelData().obs;
  Rx<VideoPlayerController?> videoController = VideoPlayerController.network('').obs;


  @override
  void onInit() {
   tabBarView();
    super.onInit();
  }

  void tabBarView()async{
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() => selectedTabIndex.value = tabController.index);
    chapterDetailsModel.value = Get.arguments;
    chapterVideoInitialize();
    await getQuestions();

  }


void chapterVideoInitialize() {
  if (chapterDetailsModel.value.video != null && chapterDetailsModel.value.video!.isNotEmpty) {
    log('url...........${chapterDetailsModel.value.video ?? ''}');
    videoController.value = VideoPlayerController.network(chapterDetailsModel.value.video ?? '');

    if (videoController.value?.value != null) {
      videoController.value!.initialize().then((_) {
        videoController.value!.addListener(() {
          if (videoController.value!.value.hasError) {
            log('Video Error: ${videoController.value!.value.errorDescription}');
            Utils.showMySnackbar(desc: 'Video Error: ${videoController.value!.value.errorDescription}');
          }
        });
      });
    }
  }
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
    videoController.value?.dispose();
    super.onClose();
  }
}
