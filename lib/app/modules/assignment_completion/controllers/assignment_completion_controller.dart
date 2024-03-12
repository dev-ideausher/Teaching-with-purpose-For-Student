import 'dart:developer';

import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/data/models/assignment_completion_model.dart';
import 'package:teaching_with_purpose_student/app/modules/home/controllers/home_controller.dart';
import 'package:teaching_with_purpose_student/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose_student/app/services/storage.dart';
import 'package:teaching_with_purpose_student/app/utils/utils.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';

class AssignmentCompletionController extends GetxController {
  final selectedSubjectIndex = 0.obs;
  String subjectId = '';
  RxBool isLoading = false.obs;
  Rx<AssignmentCompletionModel> assignmentTracking = AssignmentCompletionModel().obs;
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
  //log('arguments..........$arguments');
  subjectId = arguments['subjectId'];
  await assignmentCompletionTracking(selectedSub: subjectId);
  }


  Future<void> assignmentCompletionTracking({String? selectedSub}) async {
    isLoading(true);
    String studentId = Get.find<GetStorageService>().id;
    try {
      final response = await APIManager.getAssignmentCompletion(studentId: studentId,subjectId: selectedSub);
      if (response.data['status'] == true) {
        assignmentTracking.value = AssignmentCompletionModel.fromJson(response.data);
        log('Assignment completion data...${response.data}');
      } else {
        Utils.showMySnackbar(desc: 'Something went wrong');
      }
    } catch (e) {
       log('e...**$e');
    } finally {
      isLoading(false);
    }
  }

//  void changeSubject(int index) {
//   selectedSubjectIndex.value = index;
//   final subjectLists = Get.find<HomeController>().subjectLists.value.data;
//   if (subjectLists != null && index >= 0 && index < subjectLists.length) {
//     String subjectId = subjectLists[index]?.Id ?? '';
//     assignmentCompletionTracking(selectedSub: subjectId); 
//   }
// }

}

