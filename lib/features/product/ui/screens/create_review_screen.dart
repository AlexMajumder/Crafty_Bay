import 'package:crafty_bay/features/auth/ui/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/common/ui/widgets/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/app_theme_data.dart';
import '../../../common/ui/controllers/auth_controller.dart';
import '../controllers/create_review_controller.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key, required this.productId});
  static String name = '/create-review';
  final String productId;

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final TextEditingController _writeReviewTEController =
  TextEditingController();
  final TextEditingController _ratingReviewTEController =
  TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title:const Text('Create Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 36),
                AppThemeData.textFormField(
                  'Review Message',
                  8,
                  _writeReviewTEController,
                      (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please Enter Your Review Message';
                    } else if (value.length == 101) {
                      return 'Message highest limit 100';
                    } else {
                      return null;
                    }
                  },
                  TextInputType.text,
                  maxLength: 101,
                ),
                const SizedBox(height: 18),
                AppThemeData.textFormField(
                  'Rating', 1, _ratingReviewTEController, (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please Enter Your Rating';
                  }
                  final rating = double.tryParse(value.trim());
                  if (rating == null) {
                    return 'Please Enter a valid number for Rating';
                  } else if (rating < 1 || rating > 5) {
                    return 'Rating must be between 1 and 5';
                  }
                  return null;
                },
                  TextInputType.number,
                ),
                const SizedBox(height: 18),
                GetBuilder<CreateReviewController>(builder: (controller) {
                  if (controller.inProgress) {
                    return const CenteredCircularProgressIndicator();
                  } else {
                    return ElevatedButton(
                        onPressed: _onTapSubmit, child: const Text('Submit'),);
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSubmit() async {
    if(await Get.find<AuthController>().isUserLoggedIn()){
      if (_formKey.currentState!.validate()) {
        CreateReviewController createReviewController =
        Get.find<CreateReviewController>();
        final bool result = await createReviewController.addReview(
          widget.productId,
          _writeReviewTEController.text.trim(),
          _ratingReviewTEController.text.trim(),
        );
        if (result) {
          ShowSnackBarMessage(context, 'Review added Successfully');
          Navigator.pop(context, true);
        } else {
          ShowSnackBarMessage(context, createReviewController.errorMessage!);
        }
      }
    }else{
      Navigator.pushNamed(context, SignInScreen.name);
    }
  }


}