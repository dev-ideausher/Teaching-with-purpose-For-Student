import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/modules/chapters/controllers/chapters_controller.dart';
import 'package:teaching_with_purpose_student/app/routes/app_pages.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/custom_button.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_student/app/utils/utils.dart';


import '../../../constants/widget_constants.dart';

class SelectedChapterView extends GetWidget<ChaptersController>{
const SelectedChapterView ({Key? key}) : super(key: key);
@override
Widget build(BuildContext context){
  final data = controller.chapterDetailsModel.value;
  return Scaffold(
   appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
   child: CustomAppBar(title: data.chapterName?? '', isBack: true)),
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
                      data.concept?? '',
                      maxLines: 1,
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
                        if (controller.videoController.value != null) {
                          return Chewie(
                            controller: ChewieController(
                              videoPlayerController: controller.videoController.value!,
                              aspectRatio: controller.videoController.value!.value.aspectRatio,
                              placeholder: Container(
                                color: Colors.black,
                              )
                            ),
                          );
                        } else {
                          return Center(
                            child: Text('No video available',style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
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
            data.concept?? '',
            style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
            ),  
          16.kheightBox,
            Text(
            data.desc?? '',
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
          WidgetsConstants.buildUploadButton(text: 'Download', onTap: (){
            controller.downloadPdf();
          }),
          32.kheightBox,
            Text(
            'Questions',
            style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
            ),
          16.kheightBox,
          ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) => 8.kheightBox, 
          itemCount: controller.questionsModel.value.data?.length?? 0,
          itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    if (controller.isVideoWatched) {
                      final data = controller.questionsModel.value.data?[index];
                      Get.toNamed(Routes.QUESTIONS, arguments: data);
                    } else {
                       Utils.showMySnackbar(title: 'Attention',desc: 'Please watch the video first');
                    }
                  },
            child: Text(
              controller.questionsModel.value.data?[index]?.question?? '',
              maxLines: 2,
              style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400,color: context.kLightTextColor),
              ),
          ) ,
        ),
          40.kheightBox,
            SizedBox(
              width: 343.kw,
              height: 56.kh,
              child: StButton(title:'Proceed', onTap: (){}),
           ),          
        ],
       ),
     ),
   ) ,
  );
}

}