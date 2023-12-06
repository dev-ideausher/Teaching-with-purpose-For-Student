import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lwp_for_student/app/components/stsubject_card.dart';
import 'package:lwp_for_student/app/components/stcard.dart';
import 'package:lwp_for_student/app/components/stcard_vertical.dart';
import 'package:lwp_for_student/app/constants/image_constant.dart';
import 'package:lwp_for_student/app/modules/profile/controllers/profile_controller.dart';
import 'package:lwp_for_student/app/routes/app_pages.dart';
import 'package:lwp_for_student/app/services/colors.dart';
import 'package:lwp_for_student/app/services/responsive_size.dart';
import 'package:lwp_for_student/app/services/text_style_util.dart';
import 'package:lwp_for_student/gen/assets.gen.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: context.kGreyBack,
      body: Obx(() => 
      controller.isLoding.value?
       Center(child: CircularProgressIndicator(color: context.kPrimary)):
      SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                studentSection(),
                32.kheightBox,
                clockWidget(),
                32.kheightBox,
                Text(
                    textAlign: TextAlign.center,
                    'My Subjects',
                    style:
                        TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
                16.kheightBox,
                      InkWell(
                        onTap: () {},
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 0.84,
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 24,
                                  mainAxisSpacing: 27.5),
                          itemCount: controller.subjectLists.value.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return MySubjectCard(
                              imageWidget: controller.subjectImages[index],
                              text: controller.subjectLists.value.data?[index]?.subject ?? '',
                            );
                          },
                        ),
                      ),
                32.kheightBox,
                rowWidget(title: 'Live Quizzes', subtitle: 'See all',onTap: ()=> Get.toNamed(Routes.QUIZZ)),
                16.kheightBox,
                StCard(
                    imagePath: Assets.images.img.path,
                    height: 93.kh,
                    width: 72.kw,
                    title: 'Join Physics Quiz',
                    text1:'07 July 2023, Friday at 3:00pm',
                    text2:'Conducted by ',
                    text3: 'Esther Howard',
                    text4: 'Topics covered: ',
                    text5: 'Electric charge, Friction, Newton’s law of motion'),
                32.kheightBox,
                rowWidget(title: 'Events', subtitle: 'See all',onTap: (){}),
                16.kheightBox,
                SizedBox(
                  height: 156.kh,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => 16.kwidthBox,
                    itemCount: 3,
                    itemBuilder: (context, index) => StCardVertical(
                        borderColor: context.kLightred,
                        title: controller.eventsTitile[index],
                        text1: controller.time[index],
                        text2: controller.detailsText[index],
                        imagePath: controller.eventImages[index]),
                        
            ),
           ),
         ],
       )),
      ),
      )
    );
  }

// section for the student details like roll Number and name with img
Widget studentSection() {
 return Row(
      children: [
        ClipRRect(child: profileImg()),
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
              'Class | Roll Number',
              style: TextStyleUtil.kText14_4(
                  fontWeight: FontWeight.w400, color: Get.context!.kNeutral),
            ),
          ],
        ),
        123.kwidthBox,
        Icon(Icons.notifications, color: Get.context!.kPrimary)
      ],
    );
  }


//
  Widget profileImg() {
    if (Get.find<ProfileController>().studentModel?.data?.first?.image !=null) {
      return CachedNetworkImage(
          imageUrl: Get.find<ProfileController>().studentModel?.data?.first?.image ?? '',
          width: 48.kw,height: 48.kh,fit: BoxFit.cover);
    }
    return Image.asset(ImageConstant.tempProfileImg,
        height: 48.kh, width: 48.kw, fit: BoxFit.cover);
  }

// custom clock widget
Widget clockWidget() {
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
                textAlign: TextAlign.center,
                'Mark your attendance !',
                style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
              ),
              8.kheightBox,
              Center(
                child: Column(
                  children: [
                    Obx(() {
                      final bgColor = controller.isClockIn.value
                          ? Get.context!.kPrimary
                          : Get.context!.kRed;
                      final buttonText =
                          controller.isClockIn.value ? 'Clock In' : 'Clock Out';
                      return InkWell(
                        onTap: () => controller.toggleClock(),
                        child: Container(
                          height: 96.kh,
                          width: 96.kw,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: bgColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: controller.isClockIn.value
                                      ? Get.context!.kLightgreen
                                      : Get.context!.kLightred)),
                          child: Text(
                            textAlign: TextAlign.center,
                            buttonText,
                            style: TextStyleUtil.kText14_4(
                                fontWeight: FontWeight.w600,
                                color: Get.context!.kWhite),
                          ),
                        ),
                      );
                    }),
                    16.kheightBox,
                    Obx(
                      () => Text(
                        textAlign: TextAlign.center,
                        controller.timerText.value,
                        style: TextStyleUtil.kText12_4(
                            fontWeight: FontWeight.w500),
                      ),
                    )
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
Widget rowWidget({required String title, required String subtitle, required void Function() onTap}) {
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
