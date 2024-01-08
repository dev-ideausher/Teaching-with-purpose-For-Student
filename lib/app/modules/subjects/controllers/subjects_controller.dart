import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lwp_for_student/app/data/models/chapters_model.dart';
import 'package:lwp_for_student/app/services/dio/api_service.dart';
import 'package:lwp_for_student/app/services/global_data.dart';
import 'package:lwp_for_student/app/utils/utils.dart';
import 'package:video_player/video_player.dart';

class SubjectsController extends GetxController {
String subjectName = '';
String subjectId = '';
RxBool isLoding = false.obs;
var searchController = TextEditingController();
Rx<ChaptersModel> chapterModel = ChaptersModel().obs;
Rx<VideoPlayerController?> videoController = VideoPlayerController.network('').obs;


@override
  void onInit() {
    getArguments();
    super.onInit();
  }



 void getArguments()async{
    final Map<String, dynamic> arguments = Get.arguments;
    subjectName = arguments['subjectName'];
    subjectId = arguments['subjectId'];
    log('id...$subjectId');
    await getChapters();
 }

//-----------------------Chapter-------------------------------

  Future<void> getChapters() async {
    isLoding(true);
    try {
      final response = await APIManager.getChapter(subjectId:subjectId);
      if (response.data['status'] == true) {
        
        log('Chapters...${response.data}');

        chapterModel.value = ChaptersModel.fromJson(response.data);

        Get.find<GlobalData>().id = chapterModel.value.data![0]?.subjectId?? '';

        if (chapterModel.value.data != null &&
            chapterModel.value.data!.isNotEmpty &&
            chapterModel.value.data![0]?.video != null &&
            chapterModel.value.data![0]!.video!.isNotEmpty) {
          videoController.value = VideoPlayerController.network(
            chapterModel.value.data![0]!.video!,
          )..initialize();
        }
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
    searchController.dispose();
    videoController.value?.dispose();
    super.onClose();
  }
}
