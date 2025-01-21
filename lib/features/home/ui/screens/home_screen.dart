import 'package:crafty_bay/app/assets_path.dart';
import 'package:crafty_bay/features/common/data/models/category_model.dart';
import 'package:crafty_bay/features/common/data/models/product_model.dart';
import 'package:crafty_bay/features/common/ui/controllers/category_list_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/common/ui/widgets/category_item_widget_simmer.dart';
import 'package:crafty_bay/features/home/ui/controllers/home_banner_list_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/new_product_list_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/popular_product_list_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/special_product_list_controller.dart';
import 'package:crafty_bay/features/home/ui/widgets/home_carousel_slider_simmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
              GetBuilder<HomeBannerListController>(builder: (controller) {
                if (controller.inProgress) {
                  return const SizedBox(
                    height: 180,
                    child: HomeCarouselSliderSimmer(),
                  );
                }
                return HomeCarouselSlider(
                  bannerList: controller.bannerList,
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
              GetBuilder<PopularProductListController>(
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
              GetBuilder<SpecialProductListController>(
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
              GetBuilder<NewProductListController>(
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

  List<Widget> _getCategoryList(List<CategoryModel> categoryModels) {
    List<Widget> categoryList = [];
    for (int i = 0; i < categoryModels.length; i++) {
      categoryList.add(CategoryItemWidget(
        categoryModel: categoryModels[i],
      ));
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
      list.add( ProductItemWidget(
        productModel: productList[i],
      ));
    }
    return list;
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
