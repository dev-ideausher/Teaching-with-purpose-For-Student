import 'dart:developer';

import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/data/models/course_completion_model.dart';
import 'package:teaching_with_purpose_student/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose_student/app/services/storage.dart';
import 'package:teaching_with_purpose_student/app/utils/utils.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';

class CourseCompletionController extends GetxController {
  final selectedSubjectIndex = 0.obs;
  String subjectId = '';
  RxBool isLoading = false.obs;
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
   setArguments();
   super.onInit();
   }

  void setArguments()async{
  final Map<String, dynamic> arguments = Get.arguments;
  subjectId = arguments['subjectId'];
  await courseCompletionTracking();
  }
 

   Future<void> courseCompletionTracking({String? selectedSub}) async {
    isLoading(true);
    String studentId = Get.find<GetStorageService>().id;
    try {
      final responce = await APIManager.getCourseCompletion(studentId: studentId,subject:subjectId );
      if (responce.data['status'] == true) {
        courseCompletion.value = CourseCompletionModel.fromJson(responce.data);
        log('Course completion data...${responce.data}');
      } else {
        Utils.showMySnackbar(desc: 'Something went wrong');
      }
    } catch (e) {
       log('e...**$e');
    } finally {
      isLoading(false);
    }
  }
}