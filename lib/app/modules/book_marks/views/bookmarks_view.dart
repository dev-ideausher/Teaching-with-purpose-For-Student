import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/components/stsubject_vertical.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';

import '../controllers/book_marks_controller.dart';

class BookMarksView extends GetView<BookMarksController> {
  const BookMarksView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Bookmarks',isBack: true)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  textAlign: TextAlign.center,
                  'Subjects',
                  style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
              16.kheightBox,
              SizedBox(
                height: 101.kh,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => 16.kwidthBox,
                    itemCount: controller.subjectImage.length,
                    itemBuilder: (context, index) => Obx(() {
                          final isSubjectSelcted =
                              controller.selectedSubjectIndex.value == index;
                          return InkWell(
                            onTap: ()=> controller.selectedSubjectIndex.value = index,
                            child: StSubjectVertical(
                                color: isSubjectSelcted? context.kRed: context.kWhite,
                                svgImage: controller.subjectImage[index],
                                text: controller.subjectText[index]),
                          );
                        })),
              ),
              23.kheightBox,
              const Divider(),
              32.kheightBox,
              addedBookmarks(Assets.images.bookmarkImgfst.image(),
                  'Relations and Functions', 'Mathematics | Ordered Pairs'),
              8.kheightBox,
              addedBookmarks(Assets.images.bookmarkImgsec.image(),
                  'Relations and Functions', 'Mathematics | Ordered Pairs'),
              8.kheightBox,
              addedBookmarks(Assets.images.bookmarkImgthrd.image(),
                  'Relations and Functions', 'Mathematics | Ordered Pairs'),
            ],
          ),
        ),
      ),
    );
  }


  Widget addedBookmarks(Image bookmarkImg, String text1, String text2) {
    return SizedBox(
      height: 80.kh,
      width: 343.kw,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 64.kh,
              width: 64.kw,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(image: bookmarkImg.image)),
              child: Center(
                  child: Icon(
                Icons.play_circle_outline_outlined,
                color: Get.context!.kWhite,
              )),
            ),
            16.kwidthBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    textAlign: TextAlign.left,
                    text1,
                    style:
                        TextStyleUtil.kText14_4(fontWeight: FontWeight.w600)),
                Text(
                    textAlign: TextAlign.left,
                    text2,
                    style: TextStyleUtil.kText14_4(
                        fontWeight: FontWeight.w400,
                        color: Get.context!.kLightTextColor))
              ],
            ),
            const Spacer(),
            // 57.kwidthBox,
            Icon(Icons.bookmark, color: Get.context!.kPrimary,)
          ],
        ),
      ),
    );
  }
}
