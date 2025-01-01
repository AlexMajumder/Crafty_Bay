import 'package:crafty_bay/app/app_color.dart';
import 'package:flutter/material.dart';

class ProductQuantityIncDecButton extends StatefulWidget {
  const ProductQuantityIncDecButton({super.key, required this.onChange});


  final Function(int) onChange;

  @override
  State<ProductQuantityIncDecButton> createState() =>
      _ProductQuantityIncDecButtonState();
}

class _ProductQuantityIncDecButtonState
    extends State<ProductQuantityIncDecButton> {
  int _count = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        _buildIconButton(
            icon: Icons.remove,
            onTap: () {
              if (_count > 1) {
                _count--;
                widget.onChange(_count);
                setState(() {});
              }
            }),
        Text(
          '$_count',
          style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
        ),
        _buildIconButton(
            icon: Icons.add,
            onTap: () {
              if (_count < 20) {
                setState(() {
                  _count++;
                  widget.onChange(_count);
                });
              }
            }),
      ],
    );
  }

  Widget _buildIconButton(
      {required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: AppColors.themeColor,
            borderRadius: BorderRadius.circular(4)),
        alignment: Alignment.center,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
