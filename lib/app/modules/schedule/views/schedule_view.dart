

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/components/stexamdatesheet.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';

import '../controllers/schedule_controller.dart';

class ScheduleView extends GetView<ScheduleController> {
  const ScheduleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Schedule',isBack: false)),
      body: Obx(() => controller.isLoading.value?
      Center(child: CircularProgressIndicator(color: context.kPrimary)):
        SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textAlign: TextAlign.center,
                'Student’s Schedule',
                style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
              ),
              16.kheightBox,
             DefaultTabController(
                  length: 5,
                  child: SizedBox(
                    height: 267.kh,
                    width: double.infinity,
                    child: Column(
                      children: [
                        TabBar(
                          physics: const NeverScrollableScrollPhysics(),
                          indicatorColor: context.kPrimary,
                          labelColor: context.kPrimary,
                          unselectedLabelColor: context.kLightTextColor,
                          tabs: [
                            SizedBox(width: 48.kw,child: const Tab(text: 'Mon')),
                            SizedBox(width: 48.kw,child: const Tab(text: 'Tue')),
                            SizedBox(width: 48.kw ,child: const Tab(text: 'Wed')),
                            SizedBox(width: 48.kw,child: const Tab(text: 'Thu')),
                            SizedBox(width: 48.kw,child: const Tab(text: 'Fri')),
                          ],
                          onTap: (index) => controller.selectDay(index),
                        ),
                        Expanded(
                          child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                              children: [
                                buildTimeTable(),
                                buildTimeTable(),
                                buildTimeTable(),
                                buildTimeTable(),
                                buildTimeTable(),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              32.kheightBox,
              Text(
                textAlign: TextAlign.center,
                'Exam DateSheet',
                style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
              ),
              16.kheightBox,
              SizedBox(
                height: 562.kh,
                width: 343.kw,
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                 separatorBuilder: (context, index) => 8.kheightBox, 
                 itemCount: controller.examsheetmodel.value.data?.length?? 0,
                itemBuilder: (context, index) => StExamSheet(
                      title: controller.examsheetmodel.value.data?[index]?.examTitle?? '',
                      examDate: 'Date: 07 July 2023',
                      examTime: "${'Time: '}${controller.examsheetmodel.value.data?[index]?.examTime?? ''}",
                      fullMarks: "${'Full marks: '}${controller.examsheetmodel.value.data?[index]?.fullMarks.toString()?? ''}",
                      passingMarks:"${'Passing marks: '}${controller.examsheetmodel.value.data?[index]?.passingMarks.toString()?? ''}",
                      borderColor: context.kLightred
                ),
              ),
            ),
            ],
          ),
        ),
      ),
      )
    );
  }

  Widget buildTimeTable() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Time',    style:TextStyleUtil.kText16_5(fontWeight: FontWeight.w400)),
                Text('Subject', style:TextStyleUtil.kText16_5(fontWeight: FontWeight.w400)),
                Text('Teacher', style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400))
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: List.generate(controller.getSelectedDayTable().length,
                  (index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('${controller.getSelectedDayTable()[index].time}',
                        style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color:Get.context!.kLightTextColor)),

                    Text('${controller.getSelectedDayTable()[index].subject}',
                        style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color:Get.context!.kLightTextColor)),

                    Text('${controller.getSelectedDayTable()[index].subjectTeacher}',
                        style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))
                  ],
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}


//   Widget buildTimeTable() {
//     return Column(
//       children: [
//       16.kheightBox,
//       Table(
//         children: [
//           TableRow(
//             children: [
//               TableCell(
//                 child: Center(
//                   child: Text(
//                     'Time',
//                     style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400),
//                   ),
//                 ),
//               ),
//               TableCell(
//                 child: Center(
//                   child: Text(
//                     'Subject',
//                     style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400),
//                   ),
//                 ),
//               ),
//               TableCell(
//                 child: Center(
//                   child: Text(
//                     'Teacher',
//                     style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//      8.kheightBox,
//       Expanded(
//         child: ListView.builder(
//           itemCount: controller.getSelectedDayTable().length,
//           itemBuilder: (context, index) {
//             return Table( 
//               children: [
//                 TableRow(
//                   children: [
//                     TableCell(
//                       child: Center(
//                         child: Text(
//                           '${controller.getSelectedDayTable()[index].time}',
//                           style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor),
//                         ),
//                       ),
//                     ),
//                     TableCell(
//                       child: Center(
//                         child: Text(
//                           '${controller.getSelectedDayTable()[index].subject}',
//                           style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor),
//                         ),
//                       ),
//                     ),
//                     TableCell(
//                       child: Center(
//                         child: Text(
//                           '${controller.getSelectedDayTable()[index].subjectTeacher}',
//                           style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     ],
//   );
// }