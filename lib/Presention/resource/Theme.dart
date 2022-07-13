import 'package:flutter/material.dart';
import 'package:future_bride/Presention/resource/Font.dart';
import 'package:future_bride/Presention/resource/Styles.dart';

import 'Color.dart';
import 'Values.dart';

ThemeData getthemeData() {
  return ThemeData(
    primaryColor: ColorManger.primry,
    splashColor: ColorManger.basiccolor,
    backgroundColor: ColorManger.white,
    disabledColor: ColorManger.lightblue,
    cardTheme: const CardTheme(
        color: ColorManger.white,
        elevation: fontSize.s4,
        shadowColor: ColorManger.blue),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManger.primry,
      elevation: fontSize.s4,
      titleTextStyle: getRegularStyle(color: ColorManger.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: ColorManger.primry,
        textStyle: getSemiBoldStyle(color: ColorManger.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(fontSize.s12),
        ),
      ),
    ),
    textTheme: TextTheme(
        headline1: getSemiBoldStyle(color: ColorManger.primry),
        subtitle1: getMediumStyle(color: ColorManger.blue),
        caption: getMediumStyle(color: ColorManger.primry),
        bodyText1: getRegularStyle(color: ColorManger.lightblue)),
    inputDecorationTheme: InputDecorationTheme(
        // content padding
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle: getRegularStyle(
          color: ColorManger.lightblue,
        ),
        labelStyle: getMediumStyle(
          color: ColorManger.lightblue,
        ),
        errorStyle: getRegularStyle(color: ColorManger.error),

        // enabled border style
        enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManger.primry, width: fontSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(fontSize.s8))),

        // focused border style
        focusedBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManger.blue, width: fontSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(fontSize.s8))),

        // error border style
        errorBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManger.error, width: fontSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused border style
        focusedErrorBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManger.blue, width: fontSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)))),
  );
}
