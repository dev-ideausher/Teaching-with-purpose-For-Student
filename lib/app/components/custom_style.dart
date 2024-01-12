
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';


import '../services/text_style_util.dart';

class StStyle {
  static BoxDecoration shadowDecoration({double? radius, Color? color}) {
    return BoxDecoration(
        boxShadow: [BoxShadow(offset: const Offset(0, 3), color: color ?? const Color(0xff000000).withOpacity(0.15), blurRadius: color == null ? 10 : 0, spreadRadius: 0.3)],
        borderRadius: BorderRadius.circular(radius ?? 3.kh),
        color: color);
  }

  static BoxDecoration borderLineDecoration({double? radius, Color? color, Color? backColor}) {
    return BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(
          radius ?? 8.kh,
        ),
        border: Border.all(color: color ?? Get.context!.kPrimary, width: 1.kh));
  }


  static InputDecoration stInputDecoration({prefixIcon, suffixIcon, suffix, hint, hintColor, backGroundColor, TextStyle? hintStyle}) {
    return InputDecoration(
      isDense: true,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      suffix: suffix,
      hintText: hint,
      hintStyle: hintStyle ?? TextStyleUtil.kText14_4(color: hintColor ?? Get.context!.kNotActive),
      fillColor: backGroundColor ?? Get.context!.kGreyBack,
      filled: true,
      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.kh), borderSide: BorderSide(color: backGroundColor ?? Get.context!.kNotActive, width: 1.kh)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.kh), borderSide: BorderSide(color: backGroundColor ?? Get.context!.kNotActive, width: 1.kh)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.kh), borderSide: BorderSide(color: backGroundColor ?? Get.context!.kNotActive, width: 1.kh)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.kh), borderSide: BorderSide(color: backGroundColor ?? Get.context!.kNotActive, width: 1.kh)),
    );
  }
}
