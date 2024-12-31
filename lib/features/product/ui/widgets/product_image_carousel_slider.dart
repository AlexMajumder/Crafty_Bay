import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/app/app_color.dart';
import 'package:flutter/material.dart';
class ProductImageCarouselSlider extends StatefulWidget {
  const ProductImageCarouselSlider({
    super.key,
  });

  @override
  State<ProductImageCarouselSlider> createState() => _ProductImageCarouselSliderState();
}

class _ProductImageCarouselSliderState extends State<ProductImageCarouselSlider> {

  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 180.0,viewportFraction: 0.95,onPageChanged:(currentIndex, reason){
            _selectedIndex.value = currentIndex;
          } ),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(
                      color: AppColors.themeColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text('text $i', style: const TextStyle(fontSize: 16.0),)
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 8,),
        ValueListenableBuilder(
          valueListenable: _selectedIndex,
          builder: (context,value,_) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i = 0; i<5; i++)
                  Container(
                    height: 16,
                    width: 16,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: value == i ? AppColors.themeColor : Colors.transparent,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(20)
                    ),
                  ),
              ],
            );
          },
        )
      ],
    );
  }
}