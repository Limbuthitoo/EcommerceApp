import 'package:ecommerce/controllers/auth_controller.dart';
import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/controllers/popular_product_controller.dart';
import 'package:ecommerce/controllers/recommended_product_controller.dart';
import 'package:ecommerce/controllers/user_controller.dart';
import 'package:ecommerce/service/api/api_client.dart';
import 'package:ecommerce/service/repository/auth_repo.dart';
import 'package:ecommerce/service/repository/cart_repo.dart';
import 'package:ecommerce/service/repository/popular_product_repo.dart';
import 'package:ecommerce/service/repository/recommended_product.repo.dart';
import 'package:ecommerce/service/repository/user_repo.dart';
import 'package:ecommerce/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  //Local data in cache
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  //for api client
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));

  //for repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));

  //for controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
}
