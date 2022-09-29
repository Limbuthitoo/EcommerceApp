import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/controllers/popular_product_controller.dart';
import 'package:ecommerce/controllers/recommended_product_controller.dart';
import 'package:ecommerce/routes/route_helper.dart';
import 'package:ecommerce/view/home/product_page_body.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/app_text_field.dart';
import 'package:ecommerce/widgets/app_top.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:ecommerce/widgets/height_space.dart';
import 'package:ecommerce/widgets/search_text_field.dart';
import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainFoodPage extends StatefulWidget {
  final int pageId;
  const MainFoodPage({
    Key? key,
    this.pageId = 0,
  }) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  Future<void> _loadResources() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[widget.pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    var cartItems = Get.find<PopularProductController>();
    var searchController = TextEditingController();
    return RefreshIndicator(
      onRefresh: _loadResources,
      child: Column(
        children: [
          //Top Bar Design
          Container(
            margin: EdgeInsets.only(
                top: Dimensions.top45, bottom: Dimensions.height15),
            padding: EdgeInsets.only(
                left: Dimensions.width20, right: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: "Nepal",
                      color: AppColors.mainColor,
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: "Kathmandu",
                          color: Colors.black54,
                        ),
                        const Icon(Icons.arrow_drop_down_rounded)
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GetBuilder<PopularProductController>(builder: (controller) {
                      return GestureDetector(
                        onTap: () {
                          if (controller.totalItems >= 1)
                            Get.toNamed(RouteHelper.getCartPage());
                        },
                        child: Stack(
                          children: [
                            AppIcon(icon: Icons.shopping_cart_outlined),
                            controller.totalItems >= 1
                                ? Positioned(
                                    right: 0,
                                    top: 0,
                                    child: AppIcon(
                                        icon: Icons.circle,
                                        size: 20,
                                        iconColor: Colors.transparent,
                                        bgColor: AppColors.mainColor),
                                  )
                                : Container(),
                            cartItems.totalItems >= 1
                                ? Positioned(
                                    right: 4,
                                    top: 3,
                                    child: BigText(
                                      text: cartItems.totalItems.toString(),
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),

          //Main Content Body Design
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: FoodPageBody(),
            ),
          ),
        ],
      ),
    );
  }
}
