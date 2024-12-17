import 'package:flutter/material.dart';
class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({
    super.key, required this.searchTEController,
  });

  final TextEditingController searchTEController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchTEController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: 'Search',
        prefixIcon: Icon(Icons.search,color: Colors.grey.shade400,),

      ),

    );
  }
}