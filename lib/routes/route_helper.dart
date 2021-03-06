import 'package:food_delivery_app/pages/food/popular_food_detail.dart';
import 'package:food_delivery_app/pages/food/recommended_food_details.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  static String getInitial()=> '$initial';
  static String getPopularFood(int pageId) => '$popularFood? pageId = $pageId';
  static String getRecommendedFood(int pageId) => '$recommendedFood? pageId = $pageId';

  static List<GetPage> routes = [
    GetPage(name: "/", page: ()=> MainFoodPage()),

    GetPage(name: "/popular-food", page: (){
      var pageId = Get.parameters['pageId'];
      return PopularFoodDetail(pageId: int.parse(pageId!));
    },
      transition: Transition.fadeIn
    ),
    GetPage(name: "/recommended-food", page: (){
      var pageId = Get.parameters['pageId'];
      return RecommendedFoodDetails(pageId: int.parse(pageId!));
    },
        transition: Transition.fadeIn
    ),
  ];
}