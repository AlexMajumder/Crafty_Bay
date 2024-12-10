import 'dart:async';
import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
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

  Timer? _timer;
  int _countDown = 20;
  bool _canResend= false;
  bool _isButtonActiveAndCountDownTextShow = true;

  void _startTimer(){
    _timer = Timer.periodic(const Duration(seconds: 1), (timer){
      setState(() {
        if(_countDown>0){
          _countDown--;
        }else{
          _timer!.cancel();
          _canResend= true;
          _isButtonActiveAndCountDownTextShow = false;
        }
      });
    });
  }

  void _resendOtp(){
    if(_canResend){
     setState(() {
       _countDown = 20;
       _canResend= false;
       _isButtonActiveAndCountDownTextShow = true;
     });
     _startTimer();
    }

  }



  @override
  void initState() {
    super.initState();
    _startTimer();
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
                      if (_formKey.currentState!.validate()) {}
                    },
                    child: const Text('Next'),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  _isButtonActiveAndCountDownTextShow? RichText(
                    text:  TextSpan(
                      text: 'This text will expire in ',
                      style: const TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                            text: '${_countDown.toString()}s',
                            style: const TextStyle(color: AppColors.themeColor)),
                      ],
                    ),
                  ): const SizedBox.shrink(),
                  TextButton(onPressed:!_isButtonActiveAndCountDownTextShow ? (){
                    _resendOtp();
                  }: null,
                    child: const Text('Resend Code'),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
