import 'package:get/get.dart';
class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight/2.32;
  static double pageViewContainer = screenHeight/3.33;
  static double pageViewTextContainer = screenHeight/5.33;

  //dynamic height padding & margins
  static double height5 = screenHeight/106.66;
  static double height10 = screenHeight/53.33;
  static double height15 = screenHeight/35.55;
  static double height20 = screenHeight/26.66;
  static double height30 = screenHeight/17.77;

  //dynamic width padding & margins
  static double width5 = screenHeight/106.66;
  static double width10 = screenHeight/53.33;
  static double width15 = screenHeight/35.55;
  static double width20 = screenHeight/26.66;
  static double width30 = screenHeight/17.77;

  //dynamic font size
  static double font10 = screenHeight/53.33;
  static double font12 = screenHeight/44.44;
  static double font15 = screenHeight/35.55;
  static double font20 = screenHeight/26.66;

  //dynamic radius values
  static double radius10 = screenHeight/53.33;
  static double radius15 = screenHeight/35.55;
  static double radius20 = screenHeight/26.66;
  static double radius30 = screenHeight/17.77;

  //icon size
  static double iconSize16 = screenHeight/33.33;
  static double iconSize20 = screenHeight/26.67;
  static double iconSize24 = screenHeight/22.22;


  //list view size
  static double listViewImgSize = screenWidth/3.2;
  static double listViewTextContSize = screenWidth/4;

  //popular food
  static double popularFoodImgSize = screenHeight/2.32;

  //bottom height
  static double bottomHeightBar = screenHeight/8.89;

}