import 'dart:async';
import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/app/app_constants.dart';
import 'package:crafty_bay/features/auth/ui/controller/otp_verification_controller.dart';
import 'package:crafty_bay/features/auth/ui/controller/read_profile_controller.dart';
import 'package:crafty_bay/features/auth/ui/screens/complite_profile_screen.dart';
import 'package:crafty_bay/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:crafty_bay/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/common/ui/widgets/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.email});

  static const name = '/otp-verification';
  final String email;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final OtpVerificationController _otpVerificationController = Get.find<OtpVerificationController>();
  final ReadProfileController _readProfileController = Get.find<ReadProfileController>();

  final RxInt _remainingTime = AppConstants.resendOtpTimeOutInSec.obs;
  late Timer? _timer;
  final RxBool _enableResendCodeButton = false.obs;

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
                        const Duration(milliseconds: 300), // Pass it here
                    appContext: context,
                    controller: _otpTEController,
                    validator:(String? value){
                      if(value?.length != 6){
                        return 'Enter Your Otp';
                      }
                      return null;
                    },
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
                  GetBuilder<OtpVerificationController>(
                    builder: (controller) {
                      if(controller.inProgress){
                        return const CenteredCircularProgressIndicator();
                      }
                      return ElevatedButton(
                        onPressed: _onTapNextButton,
                        child: const Text('Next'),
                      );
                    }
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

  Future<void> _onTapNextButton() async{
    if (_formKey.currentState!.validate()) {

      final bool response = await _otpVerificationController.verifyOtp(widget.email, _otpTEController.text.trim());

      if(response) {
        if(_otpVerificationController.shouldNavigateToCompleteProfile) {
          if (mounted) {
            Navigator.pushNamed(context, CompleteProfileScreen.name);
          }
        }else{
          if (mounted) {
            Navigator.pushNamedAndRemoveUntil(
                context, MainBottomNavScreen.name, (predicate) => false);
          }
        }
      }else{
        if(mounted) {
          ShowSnackBarMessage(
              context, _otpVerificationController.errorMessage!, true);
        }
      }
    }

  }

  @override
  void dispose() {
    _otpTEController.dispose();
    _timer?.cancel();
    super.dispose();
  }
}
