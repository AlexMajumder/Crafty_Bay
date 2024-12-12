import 'dart:async';
import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/app/app_constants.dart';
import 'package:crafty_bay/features/auth/ui/screens/complite_profile_screen.dart';
import 'package:crafty_bay/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  static const name = '/otp-verification';

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RxInt _remainingTime = AppConstants.resendOtpTimeOutInSec.obs;
  late Timer? _timer;
  RxBool _enableResendCodeButton = false.obs;

  void _startResetCodeTime() {
    _remainingTime.value = AppConstants.resendOtpTimeOutInSec;
    _enableResendCodeButton.value = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _remainingTime.value--;
      if (_remainingTime.value == 0) {
        timer.cancel();
        _enableResendCodeButton.value = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startResetCodeTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  const AppLogoWidget(),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Enter OTP Code',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'A 4 digit otp sent on your mail',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  PinCodeTextField(
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    animationDuration:
                        Duration(milliseconds: 300), // Pass it here
                    appContext: context,
                    controller: _otpTEController,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      activeColor: AppColors.themeColor,
                      inactiveColor: AppColors.themeColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //if (_formKey.currentState!.validate()) {}
                      Get.toNamed(CompleteProfile.name);
                    },
                    child: const Text('Next'),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Obx(() => !_enableResendCodeButton.value
                      ? RichText(
                          text: TextSpan(
                            text: 'This text will expire in ',
                            style: const TextStyle(color: Colors.grey),
                            children: [
                              TextSpan(
                                  text: '${_remainingTime}s',
                                  style: const TextStyle(
                                      color: AppColors.themeColor)),
                            ],
                          ),
                        )
                      : const SizedBox.shrink()),
                  Obx(
                    () => TextButton(
                      onPressed: _enableResendCodeButton.value
                          ? () {
                              _startResetCodeTime();
                            }
                          : null,
                      child: const Text('Resend Code'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _otpTEController.dispose();
    _timer?.cancel();
    super.dispose();
  }
}
