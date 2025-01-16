
import 'package:crafty_bay/features/auth/ui/controller/email_verification_controller.dart';
import 'package:crafty_bay/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:crafty_bay/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:crafty_bay/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/common/ui/widgets/snack_bar_message.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  static const name = '/email-verification';

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {


  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final EmailVerificationController _emailVerificationController = Get.find<EmailVerificationController>();


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
                    'Welcome Back',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'Enter your email address',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Email Address'
                    ),
                    validator:(String? value){
                      if(value?.trim().isEmpty ?? true){
                        return'Enter your email address';
                      }
                      if(!EmailValidator.validate(value!)){
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GetBuilder<EmailVerificationController>(
                    builder: (controller) {
                      if(controller.inProgress){
                        return const CenteredCircularProgressIndicator();
                      }
                      return ElevatedButton(
                        onPressed: _onTapNextButton,
                        child: const Text('Next'),);
                    }
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _onTapNextButton() async {
    if(_formKey.currentState!.validate()){

      bool isSuccess = await _emailVerificationController.verifyEmail(_emailTEController.text.trim());
      //if (!mounted) return;
      if(isSuccess){
        Get.toNamed(OtpVerificationScreen.name);
      }else{
        if(mounted) {
          ShowSnackBarMessage(
              context, _emailVerificationController.errorMessage!);
        }
      }

      //Navigator.pushNamed(context, OtpVerificationScreen.name);
    }
  }
}
