import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/data/models/chapters_model.dart';
import 'package:teaching_with_purpose_student/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose_student/app/utils/utils.dart';


class SubjectsController extends GetxController {
String subjectName = '';
String subjectId = '';
RxBool isLoding = false.obs;
var searchController = TextEditingController();
Rx<ChaptersModel> chapterModel = ChaptersModel().obs;
Rx<ChaptersModel> filteredChapterModel = ChaptersModel().obs;


@override
  void onInit() {
    getArguments();
    log('subjectController oninited..');
    super.onInit();
  }


 void getArguments()async{
    final Map<String, dynamic> arguments = Get.arguments;
    subjectName = arguments['subjectName'];
    subjectId = arguments['subjectId'];
    // log('id...$subjectId');
    await getChapters();
 }

//-----------------------Chapter-------------------------------

  Future<void> getChapters() async {
    isLoding(true);
    try {
      final response = await APIManager.getChapter(subjectId:subjectId);
      
      if (response.data['status'] == true) {
        
      //log('Chapters...${response.data}');

      chapterModel.value = ChaptersModel.fromJson(response.data);
      //filterChapters();

      } else {
        Utils.showMySnackbar(desc: response.data['message']);
      }
    } catch (e) {
      log('error..$e');
    } finally {
      isLoding(false);
    }
  }

  // void filterChapters() {
  //   final searchText = searchController.text.toLowerCase();

  //   log('Search Text: $searchText');
    
  //   final filteredChapters = chapterModel.value.data?.where((chapter) {
  //     return chapter?.chapterName?.toLowerCase().contains(searchText) == true ||
  //            chapter?.concept?.toLowerCase().contains(searchText) == true;}).toList();
  //   log('Filtered Chapters: $filteredChapters');

  //   filteredChapterModel.value.data = filteredChapters;
  // }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
