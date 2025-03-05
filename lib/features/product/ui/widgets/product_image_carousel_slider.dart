import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../app/app_color.dart';
import '../../data/models/product_details_model.dart';

class ProductImageCarouselSlider extends StatelessWidget {
  ProductImageCarouselSlider({
    super.key,
    required this.productDetailsModel,
  });

  final ProductDetailsModel productDetailsModel;
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: false,
            autoPlayAnimationDuration: const Duration(seconds: 1),
            height: 220,
            viewportFraction: 0.95,
            onPageChanged: (currentIndex, reason) {
              _selectedIndex.value = currentIndex;
            },
          ),
          items: (productDetailsModel.data?.photos ?? []).map((photoUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Image.network(
                    photoUrl, // Now using Image.network to load the image from URL
                    fit:
                        BoxFit.cover, // Ensure the image is displayed correctly
                  ),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 16,
          child: ValueListenableBuilder(
            valueListenable: _selectedIndex,
            builder: (context, value, _) {
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0;
                        i < (productDetailsModel.data?.photos?.length ?? 0);
                        i++)
                      Container(
                        height: 24,
                        width: 24,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: value == i
                              ? AppColors.themeColor
                              : Colors.grey.shade300,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
