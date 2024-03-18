

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/modules/chapters/controllers/chapters_controller.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/storage.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_student/app/utils/utils.dart';
import '../../../constants/widget_constants.dart';

class SelectedChapterView extends GetWidget<ChaptersController> {
const SelectedChapterView({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  final data = controller.chapterDetailsModel.value;
  Get.find<GetStorageService>().chapter = data.chapterName.toString();
  Get.find<GetStorageService>().concept = data.concept.toString();

  return Scaffold(
   appBar: PreferredSize(
    preferredSize: Size.fromHeight(46.kh),
   child: CustomAppBar(title: data.chapterName ?? '', isBack: true),
   ),
   body: SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
     child: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              Center(
                child: Container(
                  color: context.kconceptColor,
                  child: Text(
                    data.concept ?? '',
                    maxLines: 1,
                    style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            40.kheightBox,
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  height: 192.kh,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Obx(
                        () {
                          if (controller.videoController.value != null) {
                            return Chewie(
                              controller: ChewieController(
                                materialProgressColors: ChewieProgressColors(
                                  bufferedColor: context.kWhite,
                                  handleColor: context.kPrimary,
                                  playedColor: context.kPrimary,
                                ),
                                videoPlayerController: controller.videoController.value!,
                                aspectRatio: 16 / 9,
                                placeholder: Container(color: Colors.black),
                              ),
                            );
                          } else {
                            return Center(
                              child: Text('No video available', style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
                            );
                          }
                        },
                      ),
                      Positioned.fill(
                        child: GestureDetector(
                          onTap: () {
                            if (controller.videoController.value != null) {
                              if (controller.videoController.value!.value.isPlaying) {
                                controller.videoController.value!.pause();
                              } else {
                                controller.videoController.value!.play();
                              }
                            }
                          },
                          child: Obx(
                            () {
                              if (controller.videoController.value != null && controller.videoController.value!.value.isPlaying) {
                                return Container(
                                  color: Colors.transparent,
                                  child: Center(
                                    child: Icon(
                                      Icons.pause,
                                      color: context.kWhite,
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
              ),
          32.kheightBox,
            Text(
            data.concept ?? '',
            style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
            ),  
          16.kheightBox,
            Text(
            data.desc ?? '',
            maxLines: 4,
            style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400, color: context.kLightTextColor),
            ),
          32.kheightBox,
            Text(
            'Download Content',
            style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
            ),
            Text(
            'Download content in PDF format',
            style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400, color: context.kLightTextColor),
            ),
          16.kheightBox,
          WidgetsConstants.buildUploadButton(text: 'Download', onTap: () {
            controller.downloadPdf();
          }),
          32.kheightBox,
            Text(
            'Questions',
            style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
            ),
          8.kheightBox,
              buildquestionWidget(
                questions: 'Questions to be shown after the video is completed',
                onTap: () {
                  if (controller.isVideoWatched) {
                    String? id = data.Id;
                    Get.toNamed(Routes.QUESTIONS, arguments: {'chapterId': id});
                  } else {
                    Utils.showMySnackbar(title: 'Attention', desc: 'Please watch the video first');
                  }
                },
              ),
        ],
       ),
     ),
   ),
  );
}

Widget buildquestionWidget({String? questions, void Function()? onTap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          questions!,
          maxLines: 2,
          style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400, color: Get.context!.kLightTextColor),
        ),
        40.kheightBox,
        InkWell(
          onTap: onTap,
          child: Container(
            height: 56.kh,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Get.context!.kPrimary,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Center(
              child: Text('Proceed',
                  style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500, color: Get.context!.kWhite)),
            ),
          ),
        ),
      ],
    );
  }
}