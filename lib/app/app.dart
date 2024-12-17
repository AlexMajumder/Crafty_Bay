import 'package:crafty_bay/app/app_theme_data.dart';
import 'package:crafty_bay/app/controller_binder.dart';
import 'package:crafty_bay/features/auth/ui/screens/complite_profile_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/email_verification_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../features/auth/ui/screens/otp_verification_screen.dart';
import '../features/common/ui/screens/main_bottom_nav_screen.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: SplashScreen.name,
      initialBinding: ControllerBinder(),
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,
      routes: <String, WidgetBuilder>{
        SplashScreen.name: (context) => const SplashScreen(),
        EmailVerificationScreen.name: (context) =>
            const EmailVerificationScreen(),
        OtpVerificationScreen.name: (context) => const OtpVerificationScreen(),
        CompleteProfile.name: (context) => const CompleteProfile(),
        MainBottomNavScreen.name: (context) => const MainBottomNavScreen(),
      },
    );
  }
}
