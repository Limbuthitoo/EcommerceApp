import 'package:ecommerce/base/custom_loader.dart';
import 'package:ecommerce/controllers/auth_controller.dart';
import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/controllers/user_controller.dart';
import 'package:ecommerce/routes/route_helper.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/account_widget.dart';
import 'package:ecommerce/widgets/app_top.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:ecommerce/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (userLoggedIn) {
      Get.find<UserController>().getUserInfo();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: "Profile",
          size: 24,
          color: Colors.white,
        ),
      ),
      body: GetBuilder<UserController>(
        builder: (userController) {
          return userLoggedIn
              ? (!userController.isLoading
                  ? Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(top: Dimensions.height20),
                      child: Column(
                        children: [
                          AppIcon(
                            icon: Icons.person,
                            bgColor: AppColors.mainColor,
                            iconColor: Colors.white,
                            iconSize: Dimensions.height30 + Dimensions.height45,
                            size: Dimensions.width15 * 10,
                          ),
                          SizedBox(
                            height: Dimensions.height30,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  //Name
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.person,
                                      bgColor: AppColors.mainColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                      size: Dimensions.width10 * 5,
                                    ),
                                    bigText: BigText(
                                      text: userController.userModel!.name,
                                    ),
                                  ),
                                  const HeightSpace(),

                                  //Phone
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.phone,
                                      bgColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                      size: Dimensions.width10 * 5,
                                    ),
                                    bigText: BigText(
                                      text: userController.userModel!.phone,
                                    ),
                                  ),
                                  const HeightSpace(),

                                  //Email
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.email,
                                      bgColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                      size: Dimensions.width10 * 5,
                                    ),
                                    bigText: BigText(
                                      text: userController.userModel!.email,
                                    ),
                                  ),
                                  const HeightSpace(),

                                  //address
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.location_on,
                                      bgColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                      size: Dimensions.width10 * 5,
                                    ),
                                    bigText: BigText(
                                      text: "Itahari, Sunsari",
                                    ),
                                  ),
                                  const HeightSpace(),

                                  //message
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.message_outlined,
                                      bgColor: Colors.redAccent,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                      size: Dimensions.width10 * 5,
                                    ),
                                    bigText: BigText(
                                      text: "Messages",
                                    ),
                                  ),

                                  const HeightSpace(),

                                  //message
                                  GestureDetector(
                                    onTap: () {
                                      if (Get.find<AuthController>()
                                          .userLoggedIn()) {
                                        Get.find<AuthController>()
                                            .clearSharedData();
                                        Get.find<CartController>().clear();
                                        Get.find<CartController>()
                                            .clearCartHistory();
                                        Get.offNamed(
                                            RouteHelper.getSignInPage());
                                      } else {
                                        print("You Logged Out");
                                      }
                                    },
                                    child: AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.logout,
                                        bgColor: Colors.redAccent,
                                        iconColor: Colors.white,
                                        iconSize: Dimensions.height10 * 5 / 2,
                                        size: Dimensions.width10 * 5,
                                      ),
                                      bigText: BigText(
                                        text: "Logout",
                                      ),
                                    ),
                                  ),

                                  const HeightSpace(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const CustomLoader())
              : Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: Dimensions.height20 * 15,
                          margin: EdgeInsets.only(
                              left: Dimensions.width10,
                              right: Dimensions.width10),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                            image: const DecorationImage(
                              fit: BoxFit.contain,
                              image: const AssetImage(
                                  "assets/images/mustlogin.png"),
                            ),
                          ),
                        ),
                        const HeightSpace(),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteHelper.getSignInPage());
                          },
                          child: Container(
                            width: Dimensions.width20 * 10,
                            height: Dimensions.height20 * 3,
                            margin: EdgeInsets.only(
                                left: Dimensions.width20,
                                right: Dimensions.width20),
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius15),
                            ),
                            child: Center(
                              child: BigText(
                                text: "Sign In",
                                color: Colors.white,
                                size: Dimensions.font20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
