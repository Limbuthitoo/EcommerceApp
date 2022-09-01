import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/app_top.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:ecommerce/widgets/icon_and_text_widget.dart';
import 'package:ecommerce/widgets/product_info_expendable.dart';
import 'package:flutter/material.dart';

class RecommendedProductDetail extends StatelessWidget {
  RecommendedProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            toolbarHeight: Dimensions.height70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTop(
                  icon: Icons.clear,
                ),
                AppTop(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20),
                      )),
                  child: Center(
                      child: BigText(
                    text: "Product Name",
                    size: Dimensions.font26,
                  )),
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                ),
                preferredSize: Size.fromHeight(Dimensions.height20)),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: Dimensions.height300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/burger.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10),
              child: Column(
                children: [
                  Container(
                    child: ProductInfoWidget(
                        text:
                            "A crusty layer of bread topped with a tangy tomato sauce, veggies/meat and layers of cheese are enough to make our mouths water. Yes, we are talking about our favourite pizza! This classic dish is always on our menus. Whether you make it at your home or order it in any restaurant or cafe, we simply can't get enough of it. And with the popularity that a pizza sees in India, we can also easily find this delicacy with street vendors! While there is a whole range of pizzas for us to devour, I think we all can agree that for non-vegetarians, nothing comes close to the comfort of a chicken pizza. However, if you are bored of ordering that same classic chicken pizza, then it is time to give it a delicious spin with some peri-peri! A crusty layer of bread topped with a tangy tomato sauce, veggies/meat and layers of cheese are enough to make our mouths water. Yes, we are talking about our favourite pizza! This classic dish is always on our menus. Whether you make it at your home or order it in any restaurant or cafe, we simply can't get enough of it. And with the popularity that a pizza sees in India, we can also easily find this delicacy with street vendors! While there is a whole range of pizzas for us to devour, I think we all can agree that for non-vegetarians, nothing comes close to the comfort of a chicken pizza. However, if you are bored of ordering that same classic chicken pizza, then it is time to give it a delicious spin with some peri-peri!A crusty layer of bread topped with a tangy tomato sauce, veggies/meat and layers of cheese are enough to make our mouths water. Yes, we are talking about our favourite pizza! This classic dish is always on our menus. Whether you make it at your home or order it in any restaurant or cafe, we simply can't get enough of it. And with the popularity that a pizza sees in India, we can also easily find this delicacy with street vendors! While there is a whole range of pizzas for us to devour, I think we all can agree that for non-vegetarians, nothing comes close to the comfort of a chicken pizza. However, if you are bored of ordering that same classic chicken pizza, then it is time to give it a delicious spin with some peri-peri!A crusty layer of bread topped with a tangy tomato sauce, veggies/meat and layers of cheese are enough to make our mouths water. Yes, we are talking about our favourite pizza! This classic dish is always on our menus. Whether you make it at your home or order it in any restaurant or cafe, we simply can't get enough of it. And with the popularity that a pizza sees in India, we can also easily find this delicacy with street vendors! While there is a whole range of pizzas for us to devour, I think we all can agree that for non-vegetarians, nothing comes close to the comfort of a chicken pizza. However, if you are bored of ordering that same classic chicken pizza, then it is time to give it a delicious spin with some peri-peri!"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Increment and Decrement
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width20 * 2.5,
                vertical: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTop(
                  iconSize: Dimensions.iconSize24,
                  icon: Icons.remove,
                  bgColor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                BigText(
                  text: "\$12.88 " + " x " + " 0 ",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                AppTop(
                  iconSize: Dimensions.iconSize24,
                  icon: Icons.add,
                  bgColor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
          Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
              top: Dimensions.height30,
              bottom: Dimensions.height20,
              left: Dimensions.width20,
              right: Dimensions.width20,
            ),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Increment and Decrement Products
                Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height20,
                        bottom: Dimensions.height20,
                        left: Dimensions.width20,
                        right: Dimensions.width20),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    )),

                // Add to cart button
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  ),
                  child:
                      BigText(text: "\$10 | Add to cart", color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
