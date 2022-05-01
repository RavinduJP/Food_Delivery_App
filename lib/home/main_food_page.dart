import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/big_text.dart';
import 'package:food_delivery_app/common/small_text.dart';
import 'package:food_delivery_app/home/food_page_body.dart';
import 'package:food_delivery_app/utils/colors.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Container(
                margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
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
                        width: 45.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: AppColors.mainColor),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FoodPageBody(),
            Row(
              children: [
                BigText(text: "Popular"),
                SmallText(text: "Food pairing"),
              ],
            ),
            Container(
              child: Text("Scrollable "),
            )
          ],
        ),
      ),
    );
  }
}
