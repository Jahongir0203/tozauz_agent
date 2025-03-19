import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tozauz_agent/core/values/app_colors.dart' show AppColors;

import '../../features/common/widget/app_text_style.dart'
    show AppTextStyles, getFontSize;

final appThemeData = ThemeData(
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: AppColors.primaryColor),
  fontFamily: 'Lato',

  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: AppColors.white,
    iconTheme: IconThemeData(color: Colors.black),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
    centerTitle: true,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 30, fontWeight: FontWeight.w700, color: AppColors.black),
    displayMedium: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.black),
    displaySmall: TextStyle(
        fontSize: 10, fontWeight: FontWeight.w500, color: AppColors.grey3),
    headlineMedium: TextStyle(
        fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.black),
    headlineLarge: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.black),
    headlineSmall: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.grey3),
    titleLarge: TextStyle(
        fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.black),
    titleMedium: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.white),
    titleSmall: TextStyle(
        fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.black),
    bodyLarge: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.black),
    bodyMedium: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.black),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.grey3,
    ),
  ),
  // fontFamily: 'SFPro',
  scaffoldBackgroundColor: AppColors.scaffoldBackground,
  cupertinoOverrideTheme: const CupertinoThemeData(brightness: Brightness.dark),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primarySwatch: Colors.red,
  primaryColor: AppColors.primaryColor,
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  }),
);

class AppTheme {
  static SystemUiOverlayStyle lightSystemUiOverlayStyle =
      const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    systemStatusBarContrastEnforced: false,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarContrastEnforced: false,
  );

  static SystemUiOverlayStyle darkSystemUiOverlayStyle =
      const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemStatusBarContrastEnforced: false,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarContrastEnforced: false,
  );

  static ThemeData lightTheme() => ThemeData(
        brightness: Brightness.light,
        cardColor: AppColors.white,
        canvasColor: AppColors.white,
        highlightColor: AppColors.grey2,

        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          backgroundColor: AppColors.white,
        ),
        dividerColor: const Color(0xff000000),
        colorScheme: ColorScheme.fromSeed(
          primary: AppColors.primaryColor,
          seedColor: AppColors.primaryColor,
          surface: AppColors.scaffoldBackground,
          onPrimary: AppColors.black,
          secondary: AppColors.primaryColor,
          onSecondary: AppColors.secondary,
        ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: AppColors.grey1, width: 0.3),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: AppColors.grey1, width: 0.3),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: AppColors.primaryColor,
          width: 1.2,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.red),
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: AppColors.grey2),
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.grey2,
          selectedLabelStyle: AppTextStyles().body14w4.copyWith(
                color: AppColors.primaryColor,
              ),
        ),
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        textTheme: TextTheme(
          displayLarge: AppTextStyles().body37w5,
          displaySmall: AppTextStyles().body24w5,
          headlineLarge: AppTextStyles().body24wB,
          headlineMedium: AppTextStyles().body20w7,
          headlineSmall: AppTextStyles().body18w5,
          titleLarge: AppTextStyles().body20w6,
          titleMedium: AppTextStyles().body16w6,
          titleSmall: TextStyle(
              fontFamily: AppTextStyles.fontFamily,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: getFontSize(14.sp),
              color: AppColors.black),
          bodyLarge: AppTextStyles().body16w4,
          bodyMedium: AppTextStyles().body14w4.copyWith(
                color: AppColors.grey5,
              ),
          bodySmall: AppTextStyles().body12w4,
          labelLarge: AppTextStyles().body16wb,
          labelMedium: AppTextStyles().body14w7.copyWith(
                color: AppColors.grey5,
              ),
          labelSmall: AppTextStyles().body12w7,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.black,
          systemOverlayStyle: lightSystemUiOverlayStyle,
        ),
      );

  static ThemeData darkTheme() => ThemeData(
        brightness: Brightness.dark,
        canvasColor: Colors.black,
        highlightColor: AppColors.grey5,
        dividerColor: AppColors.grey1,
        cardColor: const Color(0xff182633),
        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          backgroundColor: const Color(0xff182633),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.scaffoldDark,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: AppColors.grey1, width: 0.3),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: AppColors.grey1, width: 0.3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: AppColors.primaryColor,
              width: 1.2,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.red),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: AppColors.grey2),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark,
            seedColor: AppColors.primaryColor,
            background: AppColors.scaffoldBackground,
            primary: AppColors.primaryColor,
            onPrimary: AppColors.white,
            secondary: AppColors.primaryColor,
            onSecondary: AppColors.secondary),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.black,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.grey3,
          selectedLabelStyle: AppTextStyles().body14w4.copyWith(
                color: AppColors.white,
              ),
        ),
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: const Color(0xff0E1621),
        textTheme: TextTheme(
          displayLarge: AppTextStyles().body37w5.copyWith(
                color: const Color(0xffffffff),
              ),
          displaySmall: AppTextStyles().body24w5.copyWith(
                color: const Color(0xffffffff),
              ),
          headlineLarge: AppTextStyles().body24wB.copyWith(
                color: const Color(0xffffffff),
              ),
          headlineMedium: AppTextStyles().body20w7.copyWith(
                color: const Color(0xffffffff),
              ),
          headlineSmall: AppTextStyles().body18w5.copyWith(
                color: const Color(0xffffffff),
              ),
          titleLarge: AppTextStyles().body20w6.copyWith(
                color: const Color(0xffffffff),
              ),
          titleMedium: AppTextStyles().body16w6.copyWith(
                color: const Color(0xffffffff),
              ),
          titleSmall: TextStyle(
            fontFamily: AppTextStyles.fontFamily,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: getFontSize(14.sp),
            color: AppColors.black,
          ),
          bodyLarge: AppTextStyles().body16w4.copyWith(
                color: const Color(0xffffffff),
              ),
          bodyMedium: AppTextStyles().body14w4.copyWith(
                color: const Color(0xffffffff),
              ),
          bodySmall: AppTextStyles().body12w4.copyWith(
                color: const Color(0xffffffff),
              ),
          labelLarge: AppTextStyles().body16wb.copyWith(
                color: const Color(0xffffffff),
              ),
          labelMedium: AppTextStyles().body14w7.copyWith(
                color: AppColors.grey3,
              ),
          labelSmall: AppTextStyles().body12w7.copyWith(
                color: const Color(0xffffffff),
              ),
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: const Color(0xff182633),
          foregroundColor: AppColors.black,
          systemOverlayStyle: darkSystemUiOverlayStyle,
        ),
      );
}

extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
}
