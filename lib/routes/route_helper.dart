import 'package:ecommerce/view/home/main_page.dart';
import 'package:ecommerce/view/product/popular_product_detail.dart';
import 'package:ecommerce/view/product/recommended_product_detail.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularProduct = "/popular-product";
  static const String recommendedProduct = "/recommended-product";

  static String getInitial() => '$initial';
  static String getPopularFood(int pageId) => '$popularProduct?pageId=$pageId';
  static String getRecommendedFood(int pageId) =>
      '$recommendedProduct?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(
        name: popularProduct,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularProductDetail(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedProduct,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecommendedProductDetail(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
  ];
}
