import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/big_text.dart';
import 'package:food_delivery_app/common/small_text.dart';
import 'package:food_delivery_app/utils/colors.dart';

import '../../utils/dimensions.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print("current height is "+ MediaQuery.of(context).size.height.toString());
    print("current width is "+ MediaQuery.of(context).size.width.toString());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //showing the header
            Container(
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height15, bottom: Dimensions.height5),
                padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(text: "Sri Lanka", color: AppColors.mainColor,),
                        Row(
                         children: [
                            SmallText(text: "Sri Jayawardanepura", color: Colors.black54,),
                           Icon(
                             Icons.arrow_drop_down_rounded
                           )
                          ],
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        width: Dimensions.height30,
                        height: Dimensions.height30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius10),
                            color: AppColors.mainColor),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: Dimensions.iconSize24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //showing the body
            Expanded(
                child: SingleChildScrollView(
                    child: FoodPageBody(),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
