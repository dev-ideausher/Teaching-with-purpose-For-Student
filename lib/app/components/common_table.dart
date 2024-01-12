import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';

class CommoncardTable extends StatelessWidget {
  const CommoncardTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
    //  columnWidths:const <int, TableColumnWidth> {
    //  0:FixedColumnWidth(150),
    //  1:FlexColumnWidth(3),
    //  2: MaxColumnWidth(FlexColumnWidth(3), FractionColumnWidth(0.3)),
    // },
      defaultColumnWidth: const FixedColumnWidth(140),
      border: TableBorder.all(color: Colors.transparent),
      children:  [
        TableRow(
          children: [
            TableCell(child: Text('Subjects', style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400))),
            TableCell(child: Text('Grades', style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400))),
            TableCell(child: Text('Marks', style:  TextStyleUtil.kText16_5(fontWeight: FontWeight.w400))),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text('Physics',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))),
            TableCell(child: Text('A',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))),
            TableCell(child: Text('88',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text('Chemistry',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))),
            TableCell(child: Text('B',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))),
            TableCell(child: Text('70',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text('Mathematics',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))),
            TableCell(child: Text('A+',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))),
            TableCell(child: Text('92',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text('English',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))),
            TableCell(child: Text('A+',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))),
            TableCell(child: Text('95',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text('History',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))),
            TableCell(child: Text('B+',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))),
            TableCell(child: Text('76',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: Get.context!.kLightTextColor))),
          ],
        ),
      ],
    );
  }
}