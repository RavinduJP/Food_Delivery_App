import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/app_icon.dart';
import 'package:food_delivery_app/common/big_text.dart';
import 'package:food_delivery_app/common/expandable_text_widget.dart';
import 'package:food_delivery_app/utils/colors.dart';

import '../../utils/dimensions.dart';

class RecommendedFoodDetails extends StatelessWidget {
  const RecommendedFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 60,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(10),
              child: Container(
                child: Center(
                  child: BigText(
                    text: "Chinese Side",
                    size: Dimensions.font20,
                  ),
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius15),
                    topRight: Radius.circular(Dimensions.radius15),
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.mainBlackColor,
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/images/chineseFood.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandableTextWidget(
                    text: "Biryani is a mixed rice dish originating among the royal khansamas of the durbar of Old Delhi, under the Mughal Empire, during the late 16th century of the then Mughal Court. It is made with Indian spices, rice, and usually some type of meat (chicken, beef, goat, lamb, prawn, fish) or in some cases without any meat, and sometimes, in addition, eggs and potatoes. Biryani is one of the most popular dishes in South Asia, as well as among the diaspora from the region. Similar dishes are also prepared in other parts of the world such as in Iraq, Thailand, Singapore and Malaysia. Biryani is the single most-ordered dish on Indian online food ordering and delivery services. Biryani is a mixed rice dish originating among the royal khansamas of the durbar of Old Delhi, under the Mughal Empire, during the late 16th century of the then Mughal Court. It is made with Indian spices, rice, and usually some type of meat (chicken, beef, goat, lamb, prawn, fish) or in some cases without any meat, and sometimes, in addition, eggs and potatoes. Biryani is one of the most popular dishes in South Asia, as well as among the diaspora from the region. Similar dishes are also prepared in other parts of the world such as in Iraq, Thailand, Singapore and Malaysia. Biryani is the single most-ordered dish on Indian online food ordering and delivery services. Biryani is a mixed rice dish originating among the royal khansamas of the durbar of Old Delhi, under the Mughal Empire, during the late 16th century of the then Mughal Court. It is made with Indian spices, rice, and usually some type of meat (chicken, beef, goat, lamb, prawn, fish) or in some cases without any meat, and sometimes, in addition, eggs and potatoes. Biryani is one of the most popular dishes in South Asia, as well as among the diaspora from the region. Similar dishes are also prepared in other parts of the world such as in Iraq, Thailand, Singapore and Malaysia. Biryani is the single most-ordered dish on Indian online food ordering and delivery services.",
                  ),
                  margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20 * 2,
              right: Dimensions.width20 * 2,
              top: Dimensions.height5,
              bottom: Dimensions.height5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize20,
                ),
                BigText(
                  text: "\$12.88 " + " X " + " 0 ",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font20,
                ),
                AppIcon(
                  icon: Icons.add,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize20,
                ),
              ],
            ),
          ),
          Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(top: Dimensions.height10, bottom: Dimensions.height10, left: Dimensions.width10, right: Dimensions.width10),
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
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height10, bottom: Dimensions.height10, left: Dimensions.width10, right: Dimensions.width10),
                  child: BigText(
                    text: "\$10 | Add to cart",
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                    color: AppColors.mainColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}