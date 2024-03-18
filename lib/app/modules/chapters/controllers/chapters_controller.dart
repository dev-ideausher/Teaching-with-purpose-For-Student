import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:teaching_with_purpose_student/app/data/models/assignments_list_model.dart';
import 'package:teaching_with_purpose_student/app/data/models/chapters_model_data.dart';
import 'package:teaching_with_purpose_student/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose_student/app/services/storage.dart';
import 'package:teaching_with_purpose_student/app/utils/utils.dart';
import 'package:video_player/video_player.dart';

import '../../../data/models/chapter_questions_model.dart';

class ChaptersController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var selectedTabIndex = 0.obs;
  RxBool isLoding = false.obs;
  bool isVideoWatched = false;
  String chapterName = '';
  String concept = '';
  String chapterId = '';
  RxDouble downloadProgress = 0.0.obs;
  RxBool isDownloadStarted = false.obs;
  Rx<ChapterQuestionsModel> questionsModel = ChapterQuestionsModel().obs;
  Rx<ChaptersModelData> chapterDetailsModel = ChaptersModelData().obs;
  Rx<AssignmentsListModel> assignmentList = AssignmentsListModel().obs;
  Rx<VideoPlayerController?> videoController = VideoPlayerController.network('').obs;
  final GetStorageService storageService = Get.find();



  @override
  void onInit() {
   tabBarView();
    super.onInit();
  }

  void tabBarView()async{
    final Map<String, dynamic> arguments = Get.arguments;
    chapterDetailsModel.value = arguments['chapter'];
    chapterId = arguments['chapterId'];
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() => selectedTabIndex.value = tabController.index);
    await getAssignments();
    chapterVideoInitialize();

  }


void chapterVideoInitialize() {
    if (isValidVideoUrl()) {
      initializeVideoController();
      addVideoListener();
    }
  }

bool isValidVideoUrl() {
 if (chapterDetailsModel.value.video != null && chapterDetailsModel.value.video!.isNotEmpty) {
    log('url...........${chapterDetailsModel.value.video ?? ''}');
    return true;
 }
 return false;
}

void initializeVideoController() {
 videoController.value = VideoPlayerController.network(chapterDetailsModel.value.video ?? '');
 if (videoController.value?.value != null) {
    videoController.value!.initialize().then((_) {
    });
 }
}

void addVideoListener() {
 videoController.value!.addListener(() {
    if (videoController.value!.value.hasError) {
      log('Video Error: ${videoController.value!.value.errorDescription}');
      Utils.showMySnackbar(desc: 'Video Error: ${videoController.value!.value.errorDescription}');
    }
    if (videoController.value!.value.position >= videoController.value!.value.duration) {
      isVideoWatched = true;
    }
 });
}

  void resumeVideoPlayback() {
    // Retrieve stored video playback state
    final storedPosition = storageService.videoPosition;
    final storedVideoUrl = storageService.videoUrl;

    if (storedPosition != 0.0 && storedVideoUrl.isNotEmpty) {
      // Initialize video controller with stored video URL
      videoController.value = VideoPlayerController.network(storedVideoUrl);
      // Initialize and play video from stored position
      videoController.value!.initialize().then((_) {
        videoController.value!.seekTo(Duration(seconds: storedPosition.toInt()));
        videoController.value!.play();
      });
    }
  }

void downloadPdf() async {
    try {
        final data = chapterDetailsModel.value;
        if (data.uploadPdf == null || data.uploadPdf!.isEmpty) {
            Utils.showMySnackbar(desc: 'PDF is not available');
            return;
        }

        final status = await Permission.storage.request();
        if (!status.isGranted) {
            Utils.showMySnackbar(desc: 'Permission denied for storage');
            return;
        }

        isDownloadStarted(true);

        final pdfUrl = data.uploadPdf!;
        final fileName = '${data.chapterName?.replaceAll(' ', '_')}_${DateTime.now().millisecondsSinceEpoch}.pdf';
        final downloadDir = await getDownloadsDirectory();
        if (downloadDir == null) {
            isDownloadStarted(false);
            return;
        }

        final downloadPath = '${downloadDir.path}/files/$fileName';
        final file = File(downloadPath);
        if (file.existsSync()) {
            await file.delete();
        }

        final downloadedFile = await APIManager.downloadFile(
            pdfUrl,
            downloadPath: downloadPath,
            onReceiveProgress: (progress) {
                downloadProgress.value = progress;
            },
        );

        if (downloadedFile.existsSync()) {
            Utils.showMySnackbar(desc: 'PDF downloaded successfully');
            OpenFile.open(downloadPath);
        } else {
            Utils.showMySnackbar(desc: 'Error downloading PDF');
        }
    } catch (e) {
        Utils.showMySnackbar(desc: 'Error downloading PDF: $e');
    } finally {
        isDownloadStarted(false);
    }
}



//-----------------------List-Assignments-------------------------------

Future<void> getAssignments() async {
    isLoding(true);
    try {
      final responce = await APIManager.getAssignment();

      if (responce.data['status'] == true) {

        //log('assignment...${responce.data}');
        
        assignmentList.value = AssignmentsListModel.fromJson(responce.data);
      }
    } catch (e) {
      Utils.showMySnackbar(desc: '$e');
    } finally {
      isLoding(false);
    }
  }

  @override
  void onClose() {
    tabController.dispose();
    if (videoController.value != null && videoController.value!.value.isPlaying) {
      storageService.videoPosition = videoController.value!.value.position.inSeconds.toDouble();
      storageService.videoUrl = chapterDetailsModel.value.video ?? '';
    }
    videoController.value?.dispose();
    super.onClose();
  }
}
