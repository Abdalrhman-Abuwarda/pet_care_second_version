
import 'package:flutter/material.dart';
import 'package:pet_care_second_version/locator.dart';
import 'package:pet_care_second_version/utils/extension/responsive_extension.dart';

import 'colors_manager.dart';
import 'fonts-manager.dart';
import 'size_config.dart';
import 'styles_manager.dart';
import 'values_manager.dart';

class ThemeManager {
  final SizeConfig sizeConfig = sl<SizeConfig>();

  static ThemeData get lightTheme { //1
    return ThemeData( //2
        primaryColor: ColorManager.soft,

        scaffoldBackgroundColor: ColorManager.soft,
        fontFamily: 'Inter', //3
        // buttonTheme: ButtonThemeData( // 4
        //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        //   buttonColor: ColorManager.blueColor,
        // ),
        appBarTheme: const AppBarTheme(
          toolbarHeight: AppSize.s80,
            elevation: 0,
            iconTheme: IconThemeData(
              size: AppSize.s32,
              color: ColorManager.primary,
            ),
            centerTitle: true,
            // titleSpacing: 30,
            actionsIconTheme: IconThemeData(
              size: AppSize.s35,
              color:  ColorManager.primary,
            ),
            backgroundColor: ColorManager.soft,
            titleTextStyle: titleBold
        ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 30, fontFamily: FontConstants.fontFamily,fontWeight: FontWeight.w600, color: ColorManager.primary),
        displayMedium: TextStyle(fontSize: 20.0,fontFamily: FontConstants.fontFamily, fontWeight: FontWeight.w600, color: ColorManager.primary),
        displaySmall: TextStyle(fontSize: 15.0,fontFamily: FontConstants.fontFamily, fontWeight: FontWeight.w600, color: ColorManager.primary),
        headlineMedium: TextStyle(fontSize: 16.0,fontFamily: FontConstants.fontFamily, fontWeight: FontWeight.w600, color: ColorManager.primary),
        headlineSmall: TextStyle(fontSize: 13.0,fontFamily: FontConstants.fontFamily, fontWeight: FontWeight.normal, color: ColorManager.primary ),
        titleLarge: TextStyle(fontSize: 13.0,fontFamily: FontConstants.fontFamily, fontWeight: FontWeight.normal, color: ColorManager.primary),
        titleMedium: TextStyle(fontSize: 16,fontFamily:   FontConstants.fontFamily , fontWeight: FontWeight.normal, color: ColorManager.primary),
        titleSmall: TextStyle(fontSize: 20,fontFamily:    FontConstants.fontFamily, fontWeight: FontWeight.normal, color: ColorManager.primary),
        bodyMedium: TextStyle(fontSize: 13.0,fontFamily: FontConstants.fontFamily, fontWeight: FontWeight.normal, color: ColorManager.primary ),
        bodyLarge: TextStyle(fontSize: 10.0,fontFamily: FontConstants.fontFamily, fontWeight: FontWeight.normal, color: ColorManager.primary ),
        labelMedium: TextStyle(fontSize: 14.0,fontFamily: FontConstants.fontFamily, fontWeight: FontWeight.normal, color: ColorManager.primary ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primary,
          disabledBackgroundColor: ColorManager.secondGray,
          disabledForegroundColor: ColorManager.white,
          textStyle: bodyBoldWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s16),
          ),
          minimumSize: Size( AppSize.s280.height, AppSize.s56.height)
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        hintStyle: bodyRegular(color: ColorManager.secondGray),
        fillColor: ColorManager.white,
        contentPadding:
        EdgeInsets.symmetric(vertical: 17.5.height ,horizontal: AppPadding.p25.width),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: ColorManager.transparent
            )
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
                color: ColorManager.transparent
            )
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s16)),
          borderSide: BorderSide(
            color: ColorManager.error,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s16)),
          borderSide: BorderSide(
            color: ColorManager.secondary,
            width: 1,
          ),
        ),
      )
    );
  }
}