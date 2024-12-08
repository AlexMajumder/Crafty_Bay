import 'package:crafty_bay/app/app_color.dart';
import 'package:flutter/material.dart';

class AppThemeData{

 static ThemeData get lightThemeData{
    return ThemeData(
      colorSchemeSeed: AppColors.themeColor,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.themeColor,
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme:const AppBarTheme(
        backgroundColor: Colors.white,
        //elevation: 2,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
        )
      ),

      inputDecorationTheme: const InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),
        contentPadding:
        EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: OutlineInputBorder(
          borderSide:
          BorderSide(color: AppColors.themeColor, width: 1),),
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: AppColors.themeColor, width: 1),),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: AppColors.themeColor, width: 1),),
      )

    );
  }

 static ThemeData get darkThemeData{
   return ThemeData(
     colorSchemeSeed: AppColors.themeColor,
     progressIndicatorTheme: const ProgressIndicatorThemeData(
       color: AppColors.themeColor,
     ),
     //scaffoldBackgroundColor: Colors.grey,
     brightness: Brightness.dark,
   );
 }


}