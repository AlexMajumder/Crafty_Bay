import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key, required this.productId});

  final int productId;
  static const name = '/create-review';

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _review= TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Create Reviews'),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          spacing: 16,
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _firstName,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: 'First Name'
              ),
              validator:(String? value){
                if(value?.trim().isEmpty ?? true){
                  return'Enter your First Name';
                }
                return null;
              },
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _lastName,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: 'Last Name'
              ),
              validator:(String? value){
                if(value?.trim().isEmpty ?? true){
                  return'Enter your Last Name';
                }
                return null;
              },
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _review,
              maxLines: 8,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: 'Write Review'
              ),
              validator:(String? value){
                if(value?.trim().isEmpty ?? true){
                  return'Write your Review';
                }
                if(value!.trim().length < 10 ){
                  return'More enhance your comment';
                }
                return null;
              },
            ),
        
            ElevatedButton(
              onPressed: (){
                if(_formKey.currentState!.validate()){}
              }, child: const Text('Submit'),),
          ],
        ),
      ),
    );
  }

}
