import 'package:flutter/material.dart';
import 'hexColorToFlutterColor.dart';

extension ColorUtil on BuildContext {
  Color dynamicColor({required int light, required int dark}) {
    return (Theme.of(this).brightness == Brightness.light)
        ? Color(light)
        : Color(dark);
  }

  Color dynamicColour({required Color light, required Color dark}) {
    return (Theme.of(this).brightness == Brightness.light) ? light : dark;
  }

  Color get kPrimary =>
      dynamicColour(light: HexColor("#1CA74E"), dark: HexColor("#1CA74E"));

  Color get dotActive =>
      dynamicColour(light: HexColor("#F59497"), dark: HexColor("#F59497"));

  Color get dotNotActive =>
      dynamicColour(light: HexColor("#FBE0E1"), dark: HexColor("#FBE0E1"));

  Color get kBlacklight =>
      dynamicColour(light: HexColor("#5D5D5D"), dark: HexColor("#5D5D5D"));

  Color get kNotActive =>
      dynamicColour(light: HexColor("#abb7ba"), dark: HexColor("#abb7ba"));

  Color get kWhite =>
      dynamicColour(light: HexColor("#FFFFFF"), dark: HexColor("#FFFFFF"));

  Color get kWhitelight =>
      dynamicColour(light: HexColor("#F4F4F4"), dark: HexColor("#F4F4F4"));

  Color get kGreyBack =>
      dynamicColour(light: HexColor("#FAFAFA"), dark: HexColor("#FAFAFA"));

  Color get kNeutral =>
      dynamicColour(light: HexColor("#B8B8B8"), dark: HexColor("#B8B8B8"));

  Color get kPinNotActive =>
      dynamicColour(light: HexColor("#F1FFF6"), dark: HexColor("#F1FFF6"));

  Color get kRed =>
      dynamicColour(light: HexColor("#F15C5F"), dark: HexColor("#F15C5F"));

  Color get kLightred =>
      dynamicColour(light: HexColor("#F9CDCE"), dark: HexColor("#F9CDCE"));

  Color get kLightgreen =>
      dynamicColour(light: HexColor("#CAEFD7"), dark: HexColor("#CAEFD7"));

  Color get kBottomNavgrey =>
      dynamicColour(light: HexColor("#A2A2A2"), dark: HexColor("#A2A2A2"));

  Color get kLightTextColor =>
      dynamicColour(light: HexColor("#747474"), dark: HexColor("#747474"));
  
  Color get kAverageMarkColor =>
      dynamicColour(light: HexColor("#FFFDDF"), dark: HexColor("#FFFDDF"));

  Color get kconceptColor =>
      dynamicColour(light: HexColor("#FCF3F3"), dark: HexColor("#FCF3F3"));


  Color get kLightSkyBlue =>
      dynamicColour(light: HexColor("#DDF7E6"), dark: HexColor("#DDF7E6"));
}
