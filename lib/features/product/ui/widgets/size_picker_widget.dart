import 'package:flutter/material.dart';
import '../../../../app/app_color.dart';

class SizePickerWidget extends StatefulWidget {
  const SizePickerWidget(
      {super.key, required this.sizes, required this.onSizeSelected});
  final List<String> sizes;
  final ValueChanged<String> onSizeSelected;

  @override
  State<SizePickerWidget> createState() => _SizePickerWidgetState();
}

class _SizePickerWidgetState extends State<SizePickerWidget> {
  String? _selectedSize;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: getSizeItems(),
      ),
    );
  }

  List<Widget> getSizeItems() {
    List<Widget> sizeList = [];
    for (String size in widget.sizes) {
      Widget item = sizeItemDesign(
        name: size,
        onTap: () {
          _selectedSize = size;
          widget.onSizeSelected(size); // Pass selected size back to the parent
          setState(() {});
        },
        isSelected: _selectedSize == size,
      );
      sizeList.add(item);
    }
    return sizeList;
  }

  Widget sizeItemDesign(
      {required String name,
      required VoidCallback onTap,
      required bool isSelected}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(),
            color: isSelected ? AppColors.themeColor : Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            name,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
