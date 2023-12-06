import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lwp_for_student/app/components/custom_appbar.dart';
import 'package:lwp_for_student/app/components/stcard.dart';
import 'package:lwp_for_student/app/services/responsive_size.dart';
import 'package:lwp_for_student/gen/assets.gen.dart';
import '../controllers/quizz_controller.dart';

class QuizzView extends GetView<QuizzController> {
  const QuizzView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(46.kh),
          child: CustomAppBar(title: 'Live Quizzes', isBack: true)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   height: 56.kh,
              //   width: 343.kw,
              //   decoration: BoxDecoration(
              //     color: context.kWhite,
              //     borderRadius: BorderRadius.circular(8),
              //   ),
              //   child: Center(
              //     child: Obx(() => DropdownButton<String>(
              //       value: controller.selectedMonth.value,
              //       items: controller.months.map((String month) {
              //         return DropdownMenuItem<String>(
              //             value: month, child: Text(month));
              //       }).toList(),
              //       onChanged: (String? newMonth) {
              //         if (newMonth != null) {
              //           controller.selectMonth(newMonth);
              //         }
              //       },
              //     )),
              //   ),
              // ),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: Obx(() => DropdownButton<String>(
                      value: controller.selectedMonth.value,
                      items: controller.months.map((String month) {
                        return DropdownMenuItem<String>(
                            value: month, child: Text(month));
                      }).toList(),
                      onChanged: (String? newMonth) {
                        if (newMonth != null) {
                          controller.selectMonth(newMonth);
                        }
                      },
                    )),
              ),

              32.kheightBox,
              StCard(
                  title: 'Physics',
                  text1: '07 July 2023, Friday at 3:00pm',
                  text2: 'Conducted by ',
                  imagePath: Assets.images.quizImg1.path,
                  text3: 'Esther Howard',
                  text4: 'Topics covered: ',
                  text5: 'Electric charge, Friction, Newton’s law of motion',
                  height: 55.kh,
                  width: 55.kw),
              8.kheightBox,
              StCard(
                  title: 'Physics',
                  text1: '07 July 2023, Friday at 3:00pm',
                  text2: 'Conducted by ',
                  imagePath: Assets.images.quizImg1.path,
                  text3: 'Esther Howard',
                  text4: 'Topics covered: ',
                  text5: 'Electric charge, Friction, Newton’s law of motion',
                  height: 55.kh,
                  width: 55.kw),
            ],
          ),
        ),
      ),
    );
  }
}
