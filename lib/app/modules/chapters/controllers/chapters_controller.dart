import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:teaching_with_purpose_student/app/data/models/chapters_model_data.dart';
import 'package:teaching_with_purpose_student/app/data/models/questions_model.dart';
import 'package:teaching_with_purpose_student/app/data/models/questions_model_data.dart';
import 'package:teaching_with_purpose_student/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose_student/app/services/global_data.dart';
import 'package:teaching_with_purpose_student/app/utils/utils.dart';
import 'package:video_player/video_player.dart';

class ChaptersController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var selectedTabIndex = 0.obs;
  RxBool isLoding = false.obs;
  bool isVideoWatched = false;
  String chapterName = '';
  String concept = '';
  RxDouble downloadProgress = 0.0.obs;
  RxBool isDownloadStarted = false.obs;


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
          if (videoController.value!.value.position >= videoController.value!.value.duration) {
            isVideoWatched = true;
          }
        });
      });
    }
  } 
}


void downloadPdf() async {
  try {
    final data = chapterDetailsModel.value;
    if (data.uploadPdf != null && data.uploadPdf!.isNotEmpty) {

      var status = await Permission.storage.request();

      if (status.isGranted) {
        String pdfUrl = data.uploadPdf!;

        String fileName = '${data.chapterName}.pdf';

        final downloadDir = await getDownloadsDirectory();

        if (downloadDir == null) return;

        final downloadPath = '${downloadDir.path}/$fileName';

        log('path..$downloadPath');

        isDownloadStarted(true);
        await APIManager.downloadFile(
          pdfUrl,
          downloadPath: downloadPath,
          onReceiveProgress: (progress) {
            downloadProgress.value = progress;
            log('Download progress: ${downloadProgress.value}%');
          },
        );

        Utils.showMySnackbar(desc: 'PDF downloaded successfully');
      } else {
        Utils.showMySnackbar(desc: 'Permission denied for storage');
      }
    } else {
      Utils.showMySnackbar(desc: 'PDF is not available');
    }
  } catch (e) {
    log('Error downloading PDF: $e');
    Utils.showMySnackbar(desc: 'Error downloading PDF: $e');
  } finally {
    isDownloadStarted(false);
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
