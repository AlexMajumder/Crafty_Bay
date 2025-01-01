import 'package:crafty_bay/app/app_color.dart';
import 'package:flutter/material.dart';
class ColorPickerWidget extends StatefulWidget {
  const ColorPickerWidget({super.key, required this.colors, required this.onColorSelected});

  final List<String> colors;
  final Function(String) onColorSelected;

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {

  String? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.colors.map((color){
          return getColorItemWidget(name: color, onTap: (){
            _selectedColor = color;
            widget.onColorSelected(_selectedColor!);
            setState(() {});
          },
              isSelected: _selectedColor == color);
      }).toList(),
      ),
    );
  }

  Widget getColorItemWidget({required String name, required VoidCallback onTap, required bool isSelected}){
    
    return GestureDetector(
      onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            border: Border.all(),
            color: isSelected ? AppColors.themeColor : Colors.transparent
          ),
          alignment: Alignment.center,
          child: Text(name, style: TextStyle(color: isSelected ? Colors.white : null),),
        )
    );

  }

}
