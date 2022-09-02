import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/controllers/popular_product_controller.dart';
import 'package:ecommerce/controllers/recommended_product_controller.dart';
import 'package:ecommerce/service/api/api_client.dart';
import 'package:ecommerce/service/repository/cart_repo.dart';
import 'package:ecommerce/service/repository/popular_product_repo.dart';
import 'package:ecommerce/service/repository/recommended_product.repo.dart';
import 'package:ecommerce/utils/app_constant.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //for api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //for repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  //for controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
