import 'package:ecommerce/controllers/popular_product_controller.dart';
import 'package:ecommerce/service/api/api_client.dart';
import 'package:ecommerce/service/repository/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //for api client
  Get.lazyPut(() => ApiClient(appBaseUrl: ""));

  //for repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //for controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
