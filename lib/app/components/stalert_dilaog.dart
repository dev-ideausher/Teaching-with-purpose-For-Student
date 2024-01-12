import 'package:flutter/material.dart';
import 'package:teaching_with_purpose_student/app/services/colors.dart';
import 'package:teaching_with_purpose_student/app/services/text_style_util.dart';


// ignore: must_be_immutable
class LogoutDialog extends StatelessWidget {
  void Function() onPress;
  void Function() onTap;
  LogoutDialog({super.key, required this.onPress, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        textAlign: TextAlign.center,
        'Confirm Logout',
        style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w600),
      ),
      content: Text(
        textAlign: TextAlign.center,
        'Are you sure you want to logout ?',
        style: TextStyleUtil.kText14_4(
            fontWeight: FontWeight.w400, color: context.kLightTextColor),
      ),
      actions: [
        TextButton(
          onPressed: onPress,
          child: Text(
            textAlign: TextAlign.center,
            'No',
            style: TextStyleUtil.kText16_5(
                fontWeight: FontWeight.w500, color: context.kPrimary),
          )
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            textAlign: TextAlign.center,
            'Logout',
            style: TextStyleUtil.kText16_5(
                fontWeight: FontWeight.w500, color: context.kRed),
          ),
        ),
      ],
    );
  }
}
