import 'package:crafty_bay/app/assets_path.dart';
import 'package:crafty_bay/features/common/data/models/product_model.dart';
import 'package:crafty_bay/features/common/ui/controllers/category_list_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/common/ui/widgets/category_item_widget_simmer.dart';
import 'package:crafty_bay/features/home/ui/controllers/slider_list_controller.dart';
import 'package:crafty_bay/features/home/ui/widgets/home_carousel_slider_simmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../common/data/models/category/category_pagination_model.dart';
import '../../../product/ui/controllers/product_list_controller.dart';
import '../../../profile/ui/screens/profile_screen.dart';
import '../widgets/app_bar_icon_button.dart';
import '../../../common/ui/widgets/category_item_widget.dart';
import '../widgets/home_carousel_slider.dart';
import '../widgets/home_section_header.dart';
import '../../../common/ui/widgets/product_item_widget.dart';
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
              GetBuilder<SliderListController>(builder: (controller) {
                if (controller.inProgress) {
                  return const SizedBox(
                    height: 180,
                    child: HomeCarouselSliderSimmer(),
                  );
                }
                return HomeCarouselSlider(
                  sliderList: controller.bannerList,
                );
              }),
              const SizedBox(
                height: 16,
              ),
              HomeSectionHeader(
                title: 'Category',
                onTap: () {
                  Get.find<MainBottomNavController>().moveToCategory();
                },
              ),
              const SizedBox(
                height: 8,
              ),
              GetBuilder<CategoryListController>(builder: (controller) {
                if (controller.inProgress) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 16,
                      children: _getProductListSimmer(),
                    ),
                  );
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 16,
                    children: _getCategoryList(controller.categoryList),
                  ),
                );
              }),
              const SizedBox(
                height: 8,
              ),
              HomeSectionHeader(
                title: 'Popular',
                onTap: () {},
              ),
              const SizedBox(
                height: 8,
              ),
              GetBuilder<ProductListController>(
                builder: (controller) {
                  if(controller.inProgress){
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 16,
                        children: _getProductListSimmer(),
                      ),
                    );
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 16,
                      children: _getProductList(controller.productList),
                    ),
                  );
                }
              ),
              const SizedBox(
                height: 8,
              ),
              HomeSectionHeader(
                title: 'Special',
                onTap: () {},
              ),
              const SizedBox(
                height: 8,
              ),
              GetBuilder<ProductListController>(
                builder: (controller) {
                  if(controller.inProgress){
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 16,
                        children: _getProductListSimmer(),
                      ),
                    );
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 16,
                      children: _getProductList(controller.productList),
                    ),
                  );
                }
              ),
              const SizedBox(
                height: 8,
              ),
              HomeSectionHeader(
                title: 'New',
                onTap: () {},
              ),
              const SizedBox(
                height: 8,
              ),
              GetBuilder<ProductListController>(
                builder: (controller) {
                  if(controller.inProgress){
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 16,
                        children: _getProductListSimmer(),
                      ),
                    );
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 16,
                      children: _getProductList(controller.productList),
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getCategoryList(List<CategoryItemModel> categoryModels) {
    List<Widget> categoryList = [];
    for (int i = 0; i < categoryModels.length; i++) {
      categoryList.add(
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: CategoryItemWidget(categoryModel:  categoryModels[i]),
        ),
      );
    }
    return categoryList;
  }

  List<Widget> _getProductListSimmer() {
    List<Widget> productList = [];
    for (int i = 0; i < 5; i++) {
      productList.add(const CategoryItemWidgetSimmer());
    }
    return productList;
  }

  List<Widget> _getProductList(List<ProductModel> productList) {
    List<Widget> list = [];
    for (int i = 0; i < productList.length; i++) {
      list.add(
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: ProductItemWidget(
            productModel: productList[i],
          ),
        ),
      );
    }
    return list;
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.navBarAppLogoSvg),
      actions: [
        AppBerIconButton(
          icon: Icons.person_outline,
          onTap: () {
            Navigator.pushNamed(context, ProfileScreen.name);
          },
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
