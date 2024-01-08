import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lwp_for_student/app/components/custom_appbar.dart';
import 'package:lwp_for_student/app/constants/string_constants.dart';
import 'package:lwp_for_student/app/modules/chapters/controllers/chapters_controller.dart';
import 'package:lwp_for_student/app/modules/subjects/controllers/subjects_controller.dart';
import 'package:lwp_for_student/app/services/colors.dart';
import 'package:lwp_for_student/app/services/responsive_size.dart';
import 'package:lwp_for_student/app/services/text_style_util.dart';
import 'package:lwp_for_student/app/utils/utils.dart';

class SelectedChapterView extends GetWidget<ChaptersController>{
const SelectedChapterView ({Key? key}) : super(key: key);
@override
Widget build(BuildContext context){
  String chapter = controller.chapterName;
  String concept = controller.concept;
  return Scaffold(
   appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
   child: CustomAppBar(title: chapter, isBack: true)),
   body: SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
     child: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 16),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              Center(
                child: Container(
                  height: 37.kh,
                  width: 102.kw,
                  color: context.kAverageMarkColor,
                  child: Center(
                    child: Text(
                      concept,
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            40.kheightBox,
              SizedBox(
                height: 192.kh,
                width: double.infinity,
                child: Stack(
                  children: [
                    Obx(
                      () {
                        if (Get.find<SubjectsController>().videoController.value != null) {
                          return Chewie(
                            controller: ChewieController(
                              videoPlayerController: Get.find<SubjectsController>().videoController.value!,
                            ),
                          );
                        } else {
                          // Show  image or text when there is no video
                          return Center(
                            child: Text('No video available',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
                          );
                        }
                      },
                    ),
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: () {
                          if (Get.find<SubjectsController>().videoController.value != null) {
                            if (Get.find<SubjectsController>().videoController.value!.value.isPlaying) {
                              Get.find<SubjectsController>().videoController.value!.pause();
                            } else {
                              Get.find<SubjectsController>().videoController.value!.play();
                            }
                          }
                        },
                        child: Obx(
                          () {
                            if (Get.find<SubjectsController>().videoController.value != null &&
                               Get.find<SubjectsController>().videoController.value!.value.isPlaying) {
                              return Container(
                                color: Colors.transparent,
                                child:  Center(
                                  child: Icon(
                                    Icons.pause,
                                    color:context.kWhite,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          32.kheightBox,
            Text(
            'What is Ordered Pairs',
            style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
            ),  
          16.kheightBox,
            Text(
            StringConstants.onBoardTextSubtitle2,
            maxLines: 4,
            style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: context.kLightTextColor),
            ),
          32.kheightBox,
            Text(
            'Download Content',
            style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
            ),
            Text(
            'Download content in PDF format',
            style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: context.kLightTextColor),
            ),
          16.kheightBox,
          Utils.buildUploadButton(text: 'Download', onTap: (){}),
          32.kheightBox,

        ],
       ),
     ),
   ) ,
  );
}
}


// Container(
//                                 color: Colors.transparent,
//                                 child: const Center(
//                                   child: Icon(
//                                     Icons.play_arrow,
//                                     color: Colors.white,
//                                     size: 50.0,
//                                   ),
//                                 ),
//                               );