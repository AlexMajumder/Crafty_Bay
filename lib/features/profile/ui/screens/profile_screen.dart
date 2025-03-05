import 'package:cached_network_image/cached_network_image.dart';
import 'package:crafty_bay/features/auth/ui/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay/features/common/ui/widgets/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/ui/controllers/auth_controller.dart';
import '../controller/update_profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const String name = '/profile-screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _imageUrlTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _loadProfileData);
  }

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = Get.find<AuthController>().isUserLoggedIn() as bool;
    if (!isLoggedIn) {
      return Scaffold(
        appBar: AppBar(title: const Text("Profile")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("You are not logged in", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, SignUpScreen.name);
                },
                child: const Text('Log In Now'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: GetBuilder<AuthController>(
        builder: (authController) {
          final userModel = authController.profileModel;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey[300],
                          child: userModel?.avatarUrl != null &&
                              userModel!.avatarUrl!.isNotEmpty
                              ? ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: userModel.avatarUrl!,
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                              placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                              const Icon(Icons.person,
                                  size: 50, color: Colors.grey),
                            ),
                          )
                              : const Icon(Icons.person,
                              size: 50, color: Colors.grey),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.camera_alt_outlined),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _firstNameTEController,
                      decoration: const InputDecoration(labelText: 'First Name'),
                      validator: (value) => value!.isEmpty ? 'Please enter your first name' : null,
                    ),
                    TextFormField(
                      controller: _lastNameTEController,
                      decoration: const InputDecoration(labelText: 'Last Name'),
                      validator: (value) => value!.isEmpty ? 'Please enter your last name' : null,
                    ),
                    TextFormField(
                      enabled: false,
                      controller: _emailTEController,
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    TextFormField(
                      controller: _phoneTEController,
                      decoration: const InputDecoration(labelText: 'Phone'),
                      validator: (value) => value!.isEmpty ? 'Please enter your phone number' : null,
                    ),
                    TextFormField(
                      controller: _cityTEController,
                      decoration: const InputDecoration(labelText: 'City'),
                      validator: (value) => value!.isEmpty ? 'Please enter your city' : null,
                    ),
                    TextFormField(
                      controller: _imageUrlTEController,
                      decoration: const InputDecoration(labelText: 'Image URL'),
                      validator: (value) => value!.isEmpty ? 'Please enter an image URL' : null,
                    ),
                    const SizedBox(height: 20),
                    GetBuilder<UpdateProfileController>(builder: (controller) {
                      return Visibility(
                        visible: !controller.inProgress,
                        replacement: const CircularProgressIndicator(),
                        child: ElevatedButton(
                          onPressed: _onPressedUpdate,
                          child: const Text('Update'),
                        ),
                      );
                    }),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => _onPressedLoggedOut(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("Log Out"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _loadProfileData() async {
    await Future.delayed(const Duration(milliseconds: 300));
    final userModel = Get.find<AuthController>().profileModel;

    if (userModel != null) {
      setState(() {
        _firstNameTEController.text = userModel.firstName ?? '';
        _lastNameTEController.text = userModel.lastName ?? '';
        _emailTEController.text = userModel.email ?? '';
        _phoneTEController.text = userModel.phone ?? '';
        _cityTEController.text = userModel.city ?? '';
        _imageUrlTEController.text = userModel.avatarUrl ?? '';
      });
    }
  }

  void _onPressedUpdate() async {
    if (_formKey.currentState!.validate()) {
      final updateController = Get.find<UpdateProfileController>();
      final authController = Get.find<AuthController>();

      bool success = await updateController.updateProfile(
        _firstNameTEController.text.trim(),
        _lastNameTEController.text.trim(),
        _phoneTEController.text.trim(),
        _cityTEController.text.trim(),
        _imageUrlTEController.text.trim(),
      );

      if (success) {
        if (mounted) {
          Get.snackbar('Success', 'Profile has been updated', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);
        }
        await authController.getUserData();
        _loadProfileData();
      } else {
        ShowSnackBarMessage(context, updateController.errorMessage!, false);
      }
    }
  }

  void _onPressedLoggedOut(BuildContext context) {
    Get.find<AuthController>().clearData();
    Navigator.pushNamedAndRemoveUntil(context, MainBottomNavScreen.name, (route) => false);
  }
}
