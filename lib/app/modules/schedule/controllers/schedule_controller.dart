
import 'dart:developer';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/data/models/class_schedule_model.dart';
import 'package:teaching_with_purpose_student/app/data/models/days_table_model.dart';
import 'package:teaching_with_purpose_student/app/data/models/exam_sheet_model.dart';
import 'package:teaching_with_purpose_student/app/services/dio/api_service.dart';
import 'package:teaching_with_purpose_student/app/utils/utils.dart';


class ScheduleController extends GetxController {
  var selectedIndex = 0.obs;
  RxBool isLoading = false.obs;
  Rx<ExamSheetModel> examsheetmodel= ExamSheetModel().obs;
  Rx<ClassScheduleModel> classScheduleModel= ClassScheduleModel().obs;
  final RxList<DaysTableModel> mondayTable =  <DaysTableModel>[].obs;
  final RxList<DaysTableModel> tuesdayTable = <DaysTableModel>[].obs;
  final RxList<DaysTableModel> wednesdayTable = <DaysTableModel>[].obs;
  final RxList<DaysTableModel> thursdayTable = <DaysTableModel>[].obs;
  final RxList<DaysTableModel> fridayTable = <DaysTableModel>[].obs;

  @override
  void onInit() {
   scheduledTimetable();
    super.onInit();
  }
 
  List<DaysTableModel> getSelectedDayTable() {
    switch (selectedIndex.value) {
      case 0:
        return mondayTable;
      case 1:
        return tuesdayTable;
      case 2:
        return wednesdayTable;
      case 3:
        return thursdayTable;
      case 4:
        return fridayTable;
      default:
        return []; 
    }
  }

  void selectDay(int index) {
    selectedIndex.value = index;
  }



//-----------------------Exam Sheet-------------------------------

  Future<void> examSheet()async{
    isLoading(true);
    try {
      final responce = await APIManager.getExamSheet();
      if (responce.data['status'] == true) {
        // log('examSheet...${responce.data}');
      examsheetmodel.value = ExamSheetModel.fromJson(responce.data);
      }else{
        Utils.showMySnackbar(desc: 'something went wrong');
      }
    } catch (e) {
     log('error..$e');
    }finally{
      isLoading(false);
    }
  }

//-----------------------Time table-------------------------------

   Future<void> scheduledTimetable() async {
    isLoading(true);
    try {
      final response = await APIManager.getTimeTable();

      if (response.data['status'] == true) {

        classScheduleModel.value = ClassScheduleModel.fromJson(response.data);

        for (final element in classScheduleModel.value.data!) {
          for (final data in element!.timeTable!) {
            switch (data.day!.toLowerCase()) {
              case 'monday':
                mondayTable.value.add(data);
                break;
              case 'tuesday':
                tuesdayTable.value.add(data);
                break;
              case 'wednesday':
                wednesdayTable.value.add(data);
                break;
              case 'thursday':
                thursdayTable.value.add(data);
                break;
              case 'friday':
                fridayTable.value.add(data);
                break;
            }
          }
        }
        await examSheet();
      } else {
        Utils.showMySnackbar(desc: 'Something went wrong');
      }
    } catch (e) {
      log('Error: $e');
    } finally {
      isLoading(false);
    }
  }

}
