import 'package:crafty_bay/features/common/ui/controllers/category_list_controller.dart';
import 'package:crafty_bay/features/common/ui/widgets/category_item_widget.dart';
import 'package:crafty_bay/features/common/ui/widgets/category_item_widget_simmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/ui/controllers/main_bottom_nav_controller.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  static const name = 'Category-List-Screen';

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}


class _CategoryListScreenState extends State<CategoryListScreen> {

  final CategoryListController _categoryListController = Get.find<CategoryListController>();

  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController= ScrollController()..addListener(_loadModeData);
    _categoryListController.getCategoryList();
  }

  void _loadModeData(){
 if(_scrollController.position.extentAfter <300){
   _categoryListController.getCategoryList();
 }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,__) => _onPop(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Category Screen'),
          leading: IconButton(onPressed: _onPop,
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: RefreshIndicator(
          onRefresh: ()async{
            Get.find<CategoryListController>().refreshCategoryList();
          },
          child: GetBuilder<CategoryListController>(
            builder: (controller) {
              if(controller.initialInProgress){
                return GridView.builder(
                  itemCount: 30,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,
                      mainAxisSpacing: 16,crossAxisSpacing: 4),
                  itemBuilder: (context,index){

                    return  const FittedBox(child: CategoryItemWidgetSimmer(),
                    );

                  },
                );
              }
              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      controller: _scrollController,
                      itemCount: controller.categoryList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,
                          mainAxisSpacing: 16,crossAxisSpacing: 4),
                      itemBuilder: (context,index){
                    
                        return  FittedBox(child: CategoryItemWidget(categoryModel: controller.categoryList[index],),
                        );
                    
                      },
                    ),
                  ),
                  Visibility(
                    visible: controller.inProgress,
                      child: const LinearProgressIndicator()),
                ],
              );
            }
          ),
        ),
      ),
    );
  }

  void _onPop(){
    Get.find<MainBottomNavController>().backToHome();
  }

  @override
  void dispose() {
   _scrollController.dispose();
    super.dispose();
  }

}
