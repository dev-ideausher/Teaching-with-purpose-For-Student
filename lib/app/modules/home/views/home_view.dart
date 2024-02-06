import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/stcard.dart';
import 'package:teaching_with_purpose_student/app/components/stcard_vertical.dart';
import 'package:teaching_with_purpose_student/app/components/stsubject_card.dart';
import 'package:teaching_with_purpose_student/app/constants/image_constant.dart';
import 'package:teaching_with_purpose_student/app/modules/profile/controllers/profile_controller.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/dio/endpoints.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => controller.isLoding.value ?
      Center(child: CircularProgressIndicator(color: context.kPrimary)):
       SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildStudentSection(),
                      32.kheightBox,
                      buildClockWidget(),
                      32.kheightBox,
                      Text( 
                        'My Subjects',
                          style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
                      16.kheightBox,
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.84,
                                crossAxisCount: 3,
                                crossAxisSpacing: 24,
                                mainAxisSpacing: 27.5),
                        itemCount:controller.subjectLists.value.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return MySubjectCard(
                            imageWidget: controller.subjectImages[index],
                            text: controller.subjectLists.value.data?[index]?.subject ??'',
                            onTap: (){
                             final data =controller.subjectLists.value.data?[index];
                              Get.toNamed(Routes.SUBJECTS,arguments: {
                              'subjectId': data?.Id,
                              'subjectName':data?.subject
                              });
                            },
                          );
                          // controller.subjectLists.value.data![index]!.icon
                        },
                      ),
                      32.kheightBox,
                      buildRowWidget(title: 'Live Quizzes',subtitle: 'See all',onTap: () => Get.toNamed(Routes.QUIZZ)),
                      16.kheightBox,
                      InkWell(
                        onTap: () => Get.toNamed(Routes.QUIZZ),
                        child: StCard(
                            imagePath:  Endpoints.temImg,
                            title: controller.quizModel.value.data?.first?.subject??'',
                            text1: 'Date: ${controller.quizModel.value.data?.first?.date?? ''}',
                            text2: 'Conducted by ',
                            text3: controller.quizModel.value.data?.first?.conductedBy?.name??'',
                            text4: '',
                            text5:'',
                            ),
                      ),
                      32.kheightBox,
                      buildRowWidget(title: 'Events',subtitle: 'See all',onTap: () { Get.toNamed(Routes.EVENTS);}),
                      16.kheightBox,
                      SizedBox(
                        height: 156.kh,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => 16.kwidthBox,
                          itemCount: controller.eventsModel.value.data?.length?? 0,
                          itemBuilder: (context, index) => StCardVertical(
                              borderColor: context.kLightred,
                              title: controller.eventsModel.value.data?[index]?.name?? '',
                              text1: 'Date:07 July 2023',
                              text2: controller.eventsModel.value.data?[index]?.desc?? '',
                              imagePath:controller.eventsModel.value.data?[index]?.image ?? ''
                          ),
                        ),
                      ),
                    ],
                  )),
            ))
    );
  }

// section for the student details like roll Number and name with img
  Widget buildStudentSection() {
    return Obx(() => 
        Get.find<ProfileController>().isLoding.value?
        CircularProgressIndicator(color: Get.context!.kPrimary):
         Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: buildProfileImg()),
            16.kwidthBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Get.find<ProfileController>().studentModel?.data?.first?.name ?? '',
                  style: TextStyleUtil.kText20_6(fontWeight: FontWeight.w600),
                ),
                8.kheightBox,
                  Text(
                    'Class:${Get.find<ProfileController>().studentModel?.data?.first?.className ?? ''} | RollNumber:${Get.find<ProfileController>().studentModel?.data?.first?.rollNumber ?? ''}',
                    style: TextStyleUtil.kText14_4(
                        fontWeight: FontWeight.w400,
                        color: Get.context!.kNeutral),
                  ),
              ],
            ),
            // 123.kwidthBox,
            const Spacer(),
            Icon(Icons.notifications, color: Get.context!.kPrimary)
          ],
        ));
  }

//image logic
  Widget buildProfileImg() {
    if (Get.find<ProfileController>().studentModel?.data?.first?.image !=null) {
      return CachedNetworkImage(
          imageUrl:
              Get.find<ProfileController>().studentModel?.data?.first?.image ??'',
          width: 48.kw,
          height: 48.kh,
          fit: BoxFit.cover);
    }
    return Image.asset(ImageConstant.tempProfileImg,
        height: 48.kh, width: 48.kw, fit: BoxFit.cover);
  }

// custom clock widget
  Widget buildClockWidget() {
    return SizedBox(
      height: 192.kh,
      width: 343.kw,
      child: Card(
        elevation: 0.2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mark your attendance !',
                style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
              ),
              8.kheightBox,
              Center(
                child: Column(
                  children: [
                       InkWell(
                        onTap: (){
                          controller.markAttendance();
                        },
                        child: Container(
                          height: 96.kh,
                          width: 96.kw,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Get.context!.kPrimary,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Get.context!.kLightgreen)),
                          child: Text(
                            'Present',
                            style: TextStyleUtil.kText14_4(
                                fontWeight: FontWeight.w600,
                                color: Get.context!.kWhite),
                          ),
                        ),
                      ),
                    16.kheightBox,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

// insted of use multiple row in  a single tree
  Widget buildRowWidget(
      {required String title,
      required String subtitle,
      required void Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
            textAlign: TextAlign.center,
            title,
            style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
        149.kwidthBox,
        InkWell(
          onTap: onTap,
          child: Text(
              textAlign: TextAlign.center,
              subtitle,
              style: TextStyleUtil.kText14_4(
                  fontWeight: FontWeight.w400, color: Get.context!.kPrimary)),
        )
      ],
    );
  }

}
