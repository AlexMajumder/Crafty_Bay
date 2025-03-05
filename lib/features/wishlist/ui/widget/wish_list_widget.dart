import 'package:crafty_bay/features/common/ui/widgets/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/app_color.dart';
import '../../../product/ui/screens/product_details_screen.dart';
import '../../data/model/wish_list_model.dart';
import '../controller/delete_wish_list_controller.dart';
import '../controller/wish_list_controller.dart';

class WishListItemWidget extends StatefulWidget {
  const WishListItemWidget({
    super.key, required this.wishModel,
  });
  final WishModel wishModel;
  @override
  State<WishListItemWidget> createState() => _WishListItemWidgetState();
}

class _WishListItemWidgetState extends State<WishListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.name, arguments: {'productId': widget.wishModel.product!.sId});


      },
      child: SizedBox(
        width: 150,


        child: Card(
            color: Colors.white,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: (widget.wishModel.product!.photos != null &&
                      widget.wishModel.product!.photos!.isNotEmpty)
                      ? Image.network(
                    widget.wishModel.product!.photos![0],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  )
                      : Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey[300],
                    alignment: Alignment.center,
                    child: const Text(
                      "No Image Available",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ),


                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.wishModel.product!.title!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '\$${widget.wishModel.product!.currentPrice}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.themeColor),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Wrap(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              ),
                              Text(
                                '${widget.wishModel.iV}',
                                style: const TextStyle(fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: (){
                              onTapDelete(context);
                            },
                            child: Container(
                                decoration: const BoxDecoration(
                                    color: AppColors.themeColor
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.delete_outline,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
  void onTapDelete(BuildContext context)async{
    final bool result = await Get.find<DeleteWishController>().deleteWish(widget.wishModel.sId!);
    if(result){
      Get.find<WishListController>().getWishList();
      ShowSnackBarMessage(context, 'Wish Deleted Successfully');

    }else{
      ShowSnackBarMessage(context, Get.find<DeleteWishController>().errorMessage!);
    }
  }

}