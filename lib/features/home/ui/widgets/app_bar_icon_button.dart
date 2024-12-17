import 'package:flutter/material.dart';
class AppBerIconButton extends StatelessWidget {
  const AppBerIconButton({
    super.key, required this.icon, required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        radius: 15,
        child: Icon(icon,size: 18,color: Colors.black45,),
      ),
    );
  }
}