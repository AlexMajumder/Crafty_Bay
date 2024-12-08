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