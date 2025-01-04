import 'package:flutter/material.dart';
class CartReviewItemWidget extends StatelessWidget {
  const CartReviewItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 1,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 14),
        child: Column(
          children: [
            Row(
              spacing: 5,
              children: [
                const Icon(Icons.person,size: 40,),
                Text('Alex Majumder',style: textTheme.titleMedium,)
              ],
            ),
            const Text('There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour',style: TextStyle(color: Colors.grey),)
          ],
        ),
      ),
    );
  }
}