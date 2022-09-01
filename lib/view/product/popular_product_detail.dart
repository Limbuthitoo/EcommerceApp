import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/app_comment_rating.dart';
import 'package:ecommerce/widgets/app_top.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:ecommerce/widgets/height_space.dart';
import 'package:ecommerce/widgets/product_info_expendable.dart';
import 'package:flutter/material.dart';

class PopularProductDetail extends StatelessWidget {
  const PopularProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //Product Image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularProductImgSize,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/pizza.jpg"),
                ),
              ),
            ),
          ),

          //Top Bar
          Positioned(
              top: Dimensions.top45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppTop(icon: Icons.arrow_back_ios),
                  const AppTop(icon: Icons.shopping_cart_outlined)
                ],
              )),

          // Product name, ratings and comment
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularProductImgSize - 20,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20)),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppCommentRating(
                    text: "PeriPeri Piza",
                  ),

                  const HeightSpace(),
                  BigText(text: "Information"),
                  const HeightSpace(),

                  //Product Information
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: ProductInfoWidget(
                          text:
                              "A crusty layer of bread topped with a tangy tomato sauce, veggies/meat and layers of cheese are enough to make our mouths water. Yes, we are talking about our favourite pizza! This classic dish is always on our menus. Whether you make it at your home or order it in any restaurant or cafe, we simply can't get enough of it. And with the popularity that a pizza sees in India, we can also easily find this delicacy with street vendors! While there is a whole range of pizzas for us to devour, I think we all can agree that for non-vegetarians, nothing comes close to the comfort of a chicken pizza. However, if you are bored of ordering that same classic chicken pizza, then it is time to give it a delicious spin with some peri-peri!"),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),

      //Addtocart Section
      bottomNavigationBar: Container(
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
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  BigText(text: "0"),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  )
                ],
              ),
            ),

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
              child: BigText(text: "\$10 | Add to cart", color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
