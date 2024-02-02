
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:teaching_with_purpose_student/app/components/custom_style.dart';
import 'package:teaching_with_purpose_student/app/services/responsive_size.dart';

import '../services/colors.dart';
import '../services/text_style_util.dart';

class StTextField extends StatelessWidget {
  final String hint;
  final String title;
  final TextEditingController controller;
  final int maxLines;
  final void Function()? onTap;
  final bool isObscure, readOnly, enabled;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int? minLine;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? hintColor;
  final Color? backGroundColor;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String?)? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final TextStyle? hintStyle;

  const StTextField(
      {Key? key,
      required this.hint,
      this.title = "",
      this.isObscure = false,
      this.maxLength,
      this.minLine,
      this.suffix,
      this.textInputType,
      required this.controller,
      this.maxLines = 1,
      this.prefixIcon,
      this.hintColor,
      this.backGroundColor,
      this.validator,
      this.onTap,
      this.readOnly = false,
      this.enabled = true,
      this.onChanged,
      this.inputFormatters,
      this.suffixIcon,
      this.hintStyle,
      this.onFieldSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title.isNotEmpty
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0.kh),
                child: Text(title, style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500)),
              )
            : const SizedBox(),
        TextFormField(
            enabled: enabled,
            onChanged: (p) {
              if (onChanged != null) onChanged!(p);
            },
            validator: validator,
            inputFormatters: inputFormatters,
            cursorColor: context.kPrimary,
            obscureText: isObscure,
            obscuringCharacter: '*',
            onTap: onTap,
            readOnly: readOnly,
            keyboardType: textInputType ?? TextInputType.text,
            maxLines: maxLines,
            style: TextStyleUtil.kText16_5(),
            controller: controller,
            onFieldSubmitted: onFieldSubmitted,
            maxLength: maxLength,
            minLines: minLine,
            decoration: StStyle.stInputDecoration(
                backGroundColor: backGroundColor ?? context.kWhitelight,
                hint: hint,
                hintStyle: hintStyle ?? TextStyleUtil.kText14_4(color: hintColor ?? Get.context!.kNotActive),
                hintColor: hintColor ?? context.kNotActive,
                prefixIcon: prefixIcon,
                suffix: suffix,
                suffixIcon: suffixIcon)),
      ],
    );
  }
}