import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';

import 'dart:io' show Platform;

import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';
// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget {
  final String title;
  bool isBack;
  List<Widget>? actions;
  PreferredSizeWidget? bottom;
  CustomAppBar({super.key, required this.title, this.isBack = false, this.actions, this.bottom});
  @override
  Widget build(BuildContext context) {
    IconData iconData =Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back;
    return AppBar(
      title: Text(
        title,
        style:TextStyleUtil.kText20_6(fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
      leading: isBack == true? IconButton(
      onPressed: () {Get.back();},
      icon: Icon(iconData,color: context.kPrimary)): Container(),
      backgroundColor:context.kGreyBack,
      centerTitle: true,
      elevation: 0,
      actions: actions,
      bottom: bottom,
    );
  }
}