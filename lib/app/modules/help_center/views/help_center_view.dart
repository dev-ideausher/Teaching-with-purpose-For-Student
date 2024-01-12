import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/commom_richtext.dart';
import 'package:teaching_with_purpose_student/app/components/custom_appbar.dart';
import 'package:teaching_with_purpose_student/app/components/custom_textfield.dart';
import 'package:teaching_with_purpose_student/app/constants/string_constants.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
import 'package:teaching_with_purpose_student/gen/assets.gen.dart';

import '../controllers/help_center_controller.dart';

class HelpCenterView extends GetView<HelpCenterController> {
  const HelpCenterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(46.kh),
       child: CustomAppBar(title: 'Helpcenter',isBack: true)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textAlign: TextAlign.center,
                'You got a problem?',
                style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
              ),
              3.kheightBox,
              Text(
                textAlign: TextAlign.center,
                'Don’t worry we will help you to solve the problem.',
                style: TextStyleUtil.kText14_4(
                    fontWeight: FontWeight.w400,
                    color: context.kLightTextColor),
              ),
              27.kheightBox,
              StTextField(
                backGroundColor: context.kWhite,
                suffixIcon: Icon(
                  Icons.filter_list_sharp,
                  color: context.kPrimary,
                ),
                prefixIcon: Icon(
                  Icons.search_outlined,
                  color: context.kPrimary,
                ),
                hint: StringConstants.searchhelp,
                controller: controller.helpController,
              ),
              24.kheightBox,
              rowWidget('Popular Questions', 'See All'),
              27.kheightBox,
              Row(
                children: [
                  Expanded(child: qAWidget()),
                  24.kwidthBox,
                  Expanded(child: qAWidget()),
                ],
              ),
              60.kheightBox,
              suppoprtSectionWidget(
                  Assets.svg.chat, 'Chat with our experts', () {}),
              8.kheightBox,
              Container(
                height: 56.kh,
                width: 343.kw,
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Row(
                  children: [
                    Assets.svg.mail.svg(),
                    16.kwidthBox,
                    ReUsableRichText(
                        text1: 'Send us an e-mail at ',
                        text2: 'Info@acme.com',
                        style1: TextStyleUtil.kText14_4(
                            fontWeight: FontWeight.w400),
                        style2: TextStyleUtil.kText14_4(
                            fontWeight: FontWeight.w500,
                            color: context.kPrimary))
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
  rowWidget(String title, String subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
            textAlign: TextAlign.center,
            title,
            style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600)),
        149.kwidthBox,
        Text(
            textAlign: TextAlign.center,
            subtitle,
            style: TextStyleUtil.kText14_4(
                fontWeight: FontWeight.w400, color: Get.context!.kPrimary))
      ],
    );
  }

//
  Widget suppoprtSectionWidget(
      SvgGenImage image, String title, void Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56.kh,
        width: 343.kw,
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            image.svg(height: 24.kh, width: 24.kw),
            16.kwidthBox,
            Text(
                textAlign: TextAlign.center,
                title,
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500)),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            )
          ],
        ),
      ),
    );
  }


// widget for image and text
  Widget qAWidget() {
    return Column(
      children: [
        Assets.svg.qA.svg(),
        21.kheightBox,
        Container(
          width: 176.kw,
          height: 35.kh,
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          decoration: BoxDecoration(
              color: Get.context!.kPrimary,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8))),
          child: Row(
            children: [
              Text(
                textAlign: TextAlign.center,
                'How to Quickly login?',
                style: TextStyleUtil.kText12_4(
                    fontWeight: FontWeight.w400, color: Get.context!.kWhite),
              ),
              const Spacer(),
              Icon(Icons.arrow_forward, color: Get.context!.kWhite, size: 15)
            ],
          ),
        )
      ],
    );
  }
}
