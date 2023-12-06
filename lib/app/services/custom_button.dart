import 'package:flutter/material.dart';
import '../services/responsive_size.dart';
import '../services/colors.dart';
import '../services/text_style_util.dart';

class StButton extends StatelessWidget {
  final String title;
  final bool disabled;
  final bool isloading;
  final void Function()? onTap;
  final bool outline;
  final Widget? leading;
  final Widget? trailing;
  final LinearGradient? linearGradient;
  final Color? color;
  final double? borderRadius;
  final TextStyle? style;
  final double? height;

  const StButton({
    Key? key,
    required this.title,
    this.disabled = false,
    this.isloading = false,
    this.onTap,
    this.leading,
    this.trailing,
    this.linearGradient,
    this.color,
    this.borderRadius,
    this.style,
    this.height
  })  : outline = false,
        super(key: key);

  const StButton.outline({super.key, 
    required this.title,
    this.onTap,
    this.leading,
    this.trailing,
    this.linearGradient,
    this.color,
    this.borderRadius,
    this.style,
    this.height
  })  : disabled = false,
        isloading = false,
        outline = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: height??48.kh,
          alignment: Alignment.center,
          decoration: !outline
              ? BoxDecoration(
                  // color: !disabled ? color ?? ColorUtil.kcPrimaryColor : color ?? ColorUtil.kcMediumGreyColor,
                  borderRadius: BorderRadius.circular(borderRadius ?? 20.kh),
                  gradient: linearGradient ??
                      LinearGradient(
                          begin: const Alignment(0, 0),
                          end: const Alignment(0, 0),
                          colors: [!disabled ? color ?? context.kNeutral : color ?? context.kPrimary, !disabled ? color ?? context.kPrimary : color ?? context.kPrimary]),
                )
              : BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(borderRadius ?? 8.kh),
                  border: Border.all(
                    color: color ?? context.kPrimary,
                    width: 1,
                  )),
          child: !isloading
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (leading != null) leading!,
                    if (leading != null) SizedBox(width: 5.kw),
                    Padding(
                      padding:  EdgeInsets.all(4.0.kh),
                      child: Text(
                        title,
                        overflow:TextOverflow.ellipsis ,
                        style: style ??
                            TextStyleUtil.kText16_5(
                              fontWeight: !outline ? FontWeight.w500 : FontWeight.w500,
                              color: !outline ? Colors.white : context.kPrimary,
                            ),
                      ),
                    ),
                    if (trailing != null) SizedBox(width: 5.kw),
                    if (trailing != null) trailing!,
                  ],
                )
              :  const CircularProgressIndicator(
                  strokeWidth: 8,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => onTap!(),
            child: Ink(
              width: double.infinity,
              height: 48.kh,
            ),
          ),
        ),
      ],
    );
  }
}

