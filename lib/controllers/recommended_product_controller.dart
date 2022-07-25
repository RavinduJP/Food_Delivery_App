import 'package:food_delivery_app/data/repository/popular_product_repository.dart';
import 'package:food_delivery_app/data/repository/recommended_product_repository.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepository recommendedProductRepository;
  RecommendedProductController({required this.recommendedProductRepository});
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList()async {
    Response response = await recommendedProductRepository.getRecommendedProductList();
    if(response.statusCode == 200) {
      print("got products recommended");
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    }else {
      print("could not get products recommended");
    }
  }
}