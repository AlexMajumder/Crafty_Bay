import 'package:flutter/material.dart';
import '../../../../app/app_color.dart';

class ColorPickerWidget extends StatefulWidget {
  const ColorPickerWidget({super.key, required this.colors, required this.onColorSelected});
  final List<String> colors;
  final ValueChanged<String> onColorSelected;

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  String? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: getColorItems(),
      ),
    );
  }

  List<Widget> getColorItems() {
    List<Widget> colorList = [];
    for (String color in widget.colors) {
      Widget item = colorItemDesign(
        name: color,
        onTap: () {
          _selectedColor = color;
          widget.onColorSelected(color);  // Pass selected color back to the parent
          setState(() {});
        },
        isSelected: _selectedColor == color,
      );
      colorList.add(item);
    }
    return colorList;
  }

  Widget colorItemDesign(
      {required String name,
        required VoidCallback onTap,
        required bool isSelected}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 6),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(),
            color: isSelected ? AppColors.themeColor : Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(name,style: TextStyle(color: isSelected ? Colors.white : Colors.black54),),
        ),
      ),
    );
  }
}