import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/app/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/app_bar_icon_button.dart';
import '../widgets/category_item_widget.dart';
import '../widgets/home_carousel_slider.dart';
import '../widgets/home_section_header.dart';
import '../widgets/product_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              ProductSearchBar(
                searchTEController: _searchBarController,
              ),
              const SizedBox(
                height: 16,
              ),
              const HomeCarouselSlider(),
              const SizedBox(
                height: 16,
              ),
              HomeSectionHeader(
                title: 'Category',
                onTap: () {},
              ),
               const SizedBox(height: 8,),
               SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                 child: Row(
                   spacing: 16,
                  children: _getCategoryList(),
                               ),
               ),
              const SizedBox(height: 8,),
              HomeSectionHeader(
                title: 'Popular',
                onTap: () {},
              ),
              const SizedBox(height: 8,),
              
              SizedBox(
                width: 140,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: AppColors.themeColor.withValues(alpha: 0.14),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16))
                        ),
                        child: Image.asset('assets/images/shoe.png',width: 140,height: 80,),
                      ),
                       const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text('Nike shoe latest edition Model- RF#2054K',
                            maxLines: 1,style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54
                              ),),
                            SizedBox(height: 2,),
                            Row(
                              children: [
                                Text('\$100',style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.themeColor
                                ),),
                                Wrap(
                                  children: [
                                    Icon(Icons.star,color: Colors.amber,size: 18,),
                                    Text('4.5',style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.themeColor
                                    ),),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getCategoryList(){
    List<Widget> categoryList =[];
      for(int i = 0; i<10;i++){
        categoryList.add(const CategoryItemWidget());
      }
      return categoryList;
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.navBarAppLogoSvg),
      actions: [
        AppBerIconButton(
          icon: Icons.person_outline,
          onTap: () {},
        ),
        const SizedBox(
          width: 6,
        ),
        AppBerIconButton(
          icon: Icons.call,
          onTap: () {},
        ),
        const SizedBox(
          width: 6,
        ),
        AppBerIconButton(
          icon: Icons.notifications,
          onTap: () {},
        ),
        const SizedBox(
          width: 6,
        ),
      ],
    );
  }
}
