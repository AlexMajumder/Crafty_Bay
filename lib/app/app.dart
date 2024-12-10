import 'package:crafty_bay/app/app_theme_data.dart';
import 'package:crafty_bay/features/auth/ui/screens/email_verification_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import '../features/auth/ui/screens/otp_verification_screen.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.name,
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,
      routes: <String, WidgetBuilder>{
        SplashScreen.name: (context) => const SplashScreen(),
        EmailVerificationScreen.name: (context) =>
            const EmailVerificationScreen(),
        OtpVerificationScreen.name: (context) =>
        const OtpVerificationScreen(),
      },
    );
  }
}
