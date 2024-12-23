import 'package:crafty_bay/features/common/ui/widgets/category_item_widget.dart';
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
        body: GridView.builder(
          itemCount: 20,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,
              mainAxisSpacing: 16,crossAxisSpacing: 4),
          itemBuilder: (context,index){
      
            return const FittedBox(child: CategoryItemWidget());
      
          },
        ),
      ),
    );
  }

  void _onPop(){
    Get.find<MainBottomNavController>().backToHome();
  }

}
