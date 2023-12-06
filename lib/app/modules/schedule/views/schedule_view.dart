import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lwp_for_student/app/components/custom_appbar.dart';
import 'package:lwp_for_student/app/components/stexamdatesheet.dart';
import 'package:lwp_for_student/app/components/sttimetabledata.dart';
import 'package:lwp_for_student/app/services/colors.dart';
import 'package:lwp_for_student/app/services/responsive_size.dart';
import 'package:lwp_for_student/app/services/text_style_util.dart';

import '../controllers/schedule_controller.dart';

class ScheduleView extends GetView<ScheduleController> {
  const ScheduleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Schedule',isBack: false)),
      body: SingleChildScrollView(
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
                    width: 343.kw,
                    child: Column(
                      children: [
                        TabBar(
                          physics: const NeverScrollableScrollPhysics(),
                          indicatorWeight: 3,
                          indicatorColor: context.kPrimary,
                          labelColor: context.kPrimary,
                          unselectedLabelColor: context.kLightTextColor,
                          tabs: const [
                            Tab(text: 'Mon'),
                            Tab(text: 'Tue'),
                            Tab(text: 'Wed'),
                            Tab(text: 'Thu'),
                            Tab(text: 'Fri'),
                          ],
                          onTap: (index) => controller.selectDay(index),
                        ),
                        // const Divider(),
                        const Expanded(
                          child: TabBarView(
                            physics: NeverScrollableScrollPhysics(),
                              children: [
                                ScheduleWidget(ishorizontal: true),
                                ScheduleWidget(ishorizontal: true),
                                ScheduleWidget(ishorizontal: true),
                                ScheduleWidget(ishorizontal: true),
                                ScheduleWidget(ishorizontal: true),
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
              StExamSheet(
                  title: 'Physics',
                  text1: 'Date: 07 July 2023',
                  text2: 'Time: 9:00 am to 10:30 am',
                  text3: 'Full marks: 50',
                  text4: 'Passing marks: 20',
                  borderColor: context.kLightred),
              8.kheightBox,
              StExamSheet(
                  title: 'Chemistry',
                  text1: 'Date: 07 July 2023',
                  text2: 'Time: 9:00 am to 10:30 am',
                  text3: 'Full marks: 50',
                  text4: 'Passing marks: 20',
                  borderColor: context.kPrimary),
              8.kheightBox,
              StExamSheet(
                  title: 'English',
                  text1: 'Date: 07 July 2023',
                  text2: 'Time: 9:00 am to 10:30 am',
                  text3: 'Full marks: 50',
                  text4: 'Passing marks: 20',
                  borderColor: context.kNeutral),
              8.kheightBox,
              StExamSheet(
                  title: 'Mathematics',
                  text1: 'Date: 07 July 2023',
                  text2: 'Time: 9:00 am to 10:30 am',
                  text3: 'Full marks: 50',
                  text4: 'Passing marks: 20',
                  borderColor: context.kNotActive),
              8.kheightBox,
              StExamSheet(
                  title: 'History',
                  text1: 'Date: 07 July 2023',
                  text2: 'Time: 9:00 am to 10:30 am',
                  text3: 'Full marks: 50',
                  text4: 'Passing marks: 20',
                  borderColor: context.kRed),
            ],
          ),
        ),
      ),
    );
  }
}
