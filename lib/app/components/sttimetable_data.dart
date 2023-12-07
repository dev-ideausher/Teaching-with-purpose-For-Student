import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lwp_for_student/app/services/colors.dart';
import 'package:lwp_for_student/app/services/text_style_util.dart';

class ScheduleWidget extends StatelessWidget {
  final bool ishorizontal;
  const ScheduleWidget({super.key, required this.ishorizontal});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        if (ishorizontal)
          Expanded(
            child: DataTable(
              dividerThickness: 0,
              border: TableBorder.all(color: Colors.transparent,width: 0),
              showBottomBorder: false,
              columnSpacing: 22,
              dataRowHeight: 27,
              
              columns: [
                DataColumn(
                    label: Text('Time',
                        style: TextStyleUtil.kText16_5(
                            fontWeight: FontWeight.w400))),
                DataColumn(
                    label: Text('Subject',
                        style: TextStyleUtil.kText16_5(
                            fontWeight: FontWeight.w400))),
                DataColumn(
                    label: Text('Teacher',
                        style: TextStyleUtil.kText16_5(
                            fontWeight: FontWeight.w400))),
              ],
              rows: [
                buildDataRow("10:00 AM - 11:00 AM", "English", "Alexander"),
                buildDataRow("11:00 AM - 12:00 PM", "English", "Alexander"),
                buildDataRow("12:00 PM - 01:00 PM", "BREAK", "BREAK"),
                buildDataRow("01:00 PM - 02:00 PM", "English", "Alexander"),
                buildDataRow("02:00 PM - 03:00 PM", "English", "Alexander"),
              ],
            ),
          ),
      ],
    );
  }

  DataRow buildDataRow(String time, String subject, String teacher) {
    return DataRow(
      cells: [
        DataCell(Text(time,
            style: TextStyleUtil.kText14_4(
                fontWeight: FontWeight.w400,
                color: Get.context!.kLightTextColor))),
        DataCell(Text(subject,
            style: TextStyleUtil.kText14_4(
                fontWeight: FontWeight.w400,
                color: Get.context!.kLightTextColor))),
        DataCell(Text(teacher,
            style: TextStyleUtil.kText14_4(
                fontWeight: FontWeight.w400,
                color: Get.context!.kLightTextColor))),
      ],
    );
  }
}
