import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/app_icon.dart';
import 'package:food_delivery_app/common/big_text.dart';
import 'package:food_delivery_app/common/small_text.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:get/get.dart';

import '../../controllers/recommended_product_controller.dart';
import '../../routes/route_helper.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height10*3,
            left: Dimensions.width10,
              right: Dimensions.width10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize20,
                  ),
                  SizedBox(width: Dimensions.width20*5,),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.iconSize20,
                    ),
                  ),
                  AppIcon(icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize20,
                  ),
                ],
              ),
          ),
          Positioned(
            top: Dimensions.height10*6,
              left: Dimensions.width10,
              right: Dimensions.width10,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height15),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(builder: (cartController){
                    var _cartList = cartController.getItems;
                    return ListView.builder(
                        itemCount: _cartList.length,
                        itemBuilder: (_, index) {
                          return Container(
                            width: double.maxFinite,
                            height: Dimensions.height10*8,
                            // color: Colors.blue,
                            // margin: EdgeInsets.only(bottom: 5),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    var popularIndex = Get.find<PopularProductController>()
                                        .popularProductList
                                        .indexOf(_cartList[index].product!);
                                    if(popularIndex>=0) {
                                      Get.toNamed(RouteHelper.getPopularFood(popularIndex, "cartPage"));
                                    }else {
                                      var recommendedIndex = Get.find<RecommendedProductController>()
                                          .recommendedProductList
                                          .indexOf(_cartList[index].product!);
                                      Get.toNamed(RouteHelper.getRecommendedFood(recommendedIndex, "cartPage"));
                                    }
                                  },
                                  child: Container(
                                    width: Dimensions.height10*8,
                                    height: Dimensions.height10*8,
                                    margin: EdgeInsets.only(bottom: Dimensions.height10),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            AppConstants.BASE_URL+AppConstants.UPLOAD_URL+cartController.getItems[index].img!
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(Dimensions.radius10),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: Dimensions.width10),
                                Expanded(
                                  child: Container(
                                    height: Dimensions.height10*8,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        BigText(text: cartController.getItems[index].name!,
                                          color: Colors.black54,),
                                        SmallText(text: "Spicy"),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigText(text: cartController.getItems[index].price.toString(),
                                              color: Colors.redAccent,),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: Dimensions.height10,
                                                  bottom: Dimensions.height10,
                                                  left: Dimensions.width10,
                                                  right: Dimensions.width10),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(Dimensions.radius10),
                                                color: Colors.white,
                                              ),
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      cartController.addItem(_cartList[index].product!, -1);
                                                    },
                                                    child: Icon(
                                                      Icons.remove,
                                                      color: AppColors.signColor,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: Dimensions.width5 / 2,
                                                  ),
                                                  BigText(text: _cartList[index].quantity.toString()), //popularProduct.inCartItems.toString()),
                                                  SizedBox(
                                                    width: Dimensions.width5 / 2,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      cartController.addItem(_cartList[index].product!, 1);
                                                    },
                                                    child: Icon(
                                                      Icons.add,
                                                      color: AppColors.signColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  },),
                ),
          ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(builder: (cartController) {
        return Container(
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.only(
              top: Dimensions.height10,
              bottom: Dimensions.height10,
              left: Dimensions.width10,
              right: Dimensions.width10),
          decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius10 * 2),
              topRight: Radius.circular(Dimensions.radius10 * 2),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height10,
                    bottom: Dimensions.height10,
                    left: Dimensions.width10,
                    right: Dimensions.width10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius10),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: Dimensions.width5 / 2,
                    ),
                    BigText(text: "\$ " + cartController.totalAmount.toString()),
                    SizedBox(
                      width: Dimensions.width5 / 2,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // popularProduct.addItem(product);
                },
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height10,
                      bottom: Dimensions.height10,
                      left: Dimensions.width10,
                      right: Dimensions.width10),
                  child: BigText(
                    text: "Check Out",
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                    color: AppColors.mainColor,
                  ),
                ),
              ),
            ],
          ),
        );
      },),
    );
  }
}
