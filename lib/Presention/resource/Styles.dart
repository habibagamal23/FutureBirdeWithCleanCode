import 'package:flutter/material.dart';
import 'package:future_bride/Presention/resource/Font.dart';

TextStyle _getTextStyle(double size, FontWeight fonttwight, Color color) {
  return TextStyle(
      fontSize: size,
      fontWeight: fonttwight,
      color: color,
      fontFamily: FontConstant.fontfmly);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = fontSize.s14, required Color color}) {
  return _getTextStyle(fontSize, Fontweight.regular, color);
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = fontSize.s16, required Color color}) {
  return _getTextStyle(fontSize, Fontweight.medium, color);
}

// medium style
TextStyle getLightStyle(
    {double fontSize = fontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, Fontweight.light, color);
}

// bold style

TextStyle getBoldtStyle(
    {double fontSize = fontSize.s20, required Color color}) {
  return _getTextStyle(fontSize, Fontweight.bold, color);
}

// semibold style

TextStyle getSemiBoldStyle(
    {double fontSize = fontSize.s18, required Color color}) {
  return _getTextStyle(fontSize, Fontweight.semiBold, color);
}
