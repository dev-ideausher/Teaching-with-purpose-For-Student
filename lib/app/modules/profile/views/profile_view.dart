
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/components/stbottom_sheet.dart';
import 'package:teaching_with_purpose_student/app/constants/image_constant.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(46.kh),
            child: CustomAppBar(title: 'Profile', isBack: false)),
        body: Obx(() => controller.isLoding.value?
       Center(child: CircularProgressIndicator(color: context.kPrimary,)):
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      profile(),
                      32.kheightBox,
                      profileSectionWidget(
                          image: Assets.svg.editProfile,
                          title: 'Edit Profile',
                          onTap: () => Get.toNamed(Routes.EDIT_PROFILE)),
                      8.kheightBox,
                      profileSectionWidget(
                          image: Assets.svg.educationProfile,
                          title: 'Education Profile',
                          onTap: () => Get.toNamed(Routes.EDUCATION_PROFILE)),
                      8.kheightBox,
                      profileSectionWidget(
                          image: Assets.svg.attendance,
                          title: 'My Attendance',
                          onTap: () => Get.toNamed(Routes.ATTENDANCE)),
                      8.kheightBox,
                      profileSectionWidget(
                          image: Assets.svg.bookmark,
                          title: 'Bookmarks',
                          onTap: () => Get.toNamed(Routes.BOOK_MARKS)),
                      8.kheightBox,
                      profileSectionWidget(
                          image: Assets.svg.feedbackOutline,
                          title: 'Student Feedbacks',
                          onTap: () => Get.toNamed(Routes.FEEDBACKS)),
                      8.kheightBox,
                      profileSectionWidget(
                          image: Assets.svg.ratingOutline,
                          title: 'App Review & Ratings',
                          onTap: () => showBottomSheetWidget(context)),
                      8.kheightBox,
                      profileSectionWidget(
                          image: Assets.svg.language,
                          title: 'Content Language',
                          onTap: () {}),
                      8.kheightBox,
                      profileSectionWidget(
                          image: Assets.svg.password,
                          title: 'Change Password',
                          onTap: () => Get.toNamed(Routes.CHANGE_PASSWORD)),
                      8.kheightBox,
                      profileSectionWidget(
                          image: Assets.svg.helpCircle,
                          title: 'Help Center',
                          onTap: () => Get.toNamed(Routes.HELP_CENTER)),
                      8.kheightBox,
                      profileSectionWidget(
                          image: Assets.svg.logout,
                          title: 'Logout',
                          onTap: () {
                            logoutWidget();
                          }),
                    ],
                  ),
          ),
        )
        ));
  }

//
  Widget profile() {
    return Column(
      children: [
        Stack(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: profileImg(),
              ),
            ),
            Positioned(
                bottom: 12,
                right: 120,
                child: InkWell(
                    onTap: (){},
                    child: Assets.svg.addPlus.svg(height: 29.kh, width: 29.kw)))
          ],
        ),
        8.kheightBox,
        Text(
          'Hi, ${controller.studentModel?.data?.first?.name?? ''}',
          textAlign: TextAlign.center,
          style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
        ),
        8.kheightBox,
        Text(
            '${controller.studentModel?.data?.first?.className ?? 'Class'} | ${controller.studentModel?.data?.first?.rollNumber ?? '123'}',
            textAlign: TextAlign.center,
            style: TextStyleUtil.kText14_4(
                fontWeight: FontWeight.w400,
                color: Get.context!.kLightTextColor))
      ],
    );
  }

//
  Widget profileImg() {
    if (controller.studentModel?.data?.first?.image != null) {
      return CachedNetworkImage(
          imageUrl: controller.studentModel?.data?.first?.image ?? '',
          width: 100.kw,
          height: 100.kh,
          fit: BoxFit.cover);
    }
    return Image.asset(ImageConstant.tempProfileImg,
        height: 100.kh, width: 100.kw, fit: BoxFit.cover);
  }

//
  Widget profileSectionWidget(
      {required SvgGenImage image, required String title, required void Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 57.kh,
        width: 343.kw,
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Get.context!.kWhite),
        child: Row(
          children: [
            image.svg(),
            16.kwidthBox,
            Text(
                textAlign: TextAlign.center,
                title,
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500)),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 15)
          ],
        ),
      ),
    );
  }

//rating Section
  showBottomSheetWidget(BuildContext context) {
    return showModalBottomSheet(
      enableDrag: false,
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => ResponseBottomSheet(
        onTap: () => Get.back(),
        bottomSheetImg: Lottie.asset('assets/lottiefiles/rating.json'),
        title: 'Enjoying Teaching With Purpose ?',
        text1:
            'Support us by giving rate and your precious review !It will take few seconds only.',
        text2: 'Maybe Later',
      ),
    );
  }

  // dialog box for log-out
  logoutWidget() {
    return Get.defaultDialog(
        title: 'Confirm Logout',
        titleStyle: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
        middleText: 'Are you sure you want to logout ?',
        middleTextStyle: TextStyleUtil.kText14_4(
            fontWeight: FontWeight.w400, color: Get.context!.kLightTextColor),
        cancel:
            TextButton(onPressed: () => Get.back(), child: const Text('No')),
        confirm:
            TextButton(onPressed: (){
              controller.logout();
            }, child: const Text('Logout'))
        );
  }
}
