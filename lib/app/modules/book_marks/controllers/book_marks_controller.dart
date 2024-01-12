import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';

class BookMarksController extends GetxController {

  final selectedSubjectIndex = 0.obs;


  List<SvgGenImage> subjectImage = [
    Assets.svg.allSubjects,
    Assets.svg.maths,
    Assets.svg.physicsRed,
    Assets.svg.chemistry,
    Assets.svg.history,
    Assets.svg.geography,
    Assets.svg.biology,
  ];

  List<String> subjectText = [
  'All Subjects',
  'Mathematics',
  'Physics',
  'chemistry',
  'History',
  'Geography',
  'biology',
  ];
}
