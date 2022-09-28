import 'package:ecommerce/view/auth/signin_page.dart';
import 'package:ecommerce/view/cart/cart_page.dart';
import 'package:ecommerce/view/home/home_page.dart';
import 'package:ecommerce/view/product/popular_product_detail.dart';
import 'package:ecommerce/view/product/recommended_product_detail.dart';
import 'package:ecommerce/view/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularProduct = "/popular-product";
  static const String recommendedProduct = "/recommended-product";
  static const String cartPage = "/cart-page";
  static const String signIn = "/sign-in";

  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';
  static String getPopularFood(int pageId, String page) =>
      '$popularProduct?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedProduct?pageId=$pageId&page=$page';
  static String getCartPage() => "$cartPage";
  static String getSignInPage() => "$signIn";

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(
        name: signIn,
        page: () {
          return SigninPage();
        },
        transition: Transition.fade),
    GetPage(
        name: popularProduct,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return PopularProductDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedProduct,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecommendedProductDetail(
              pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },
        transition: Transition.fadeIn),
  ];
}
