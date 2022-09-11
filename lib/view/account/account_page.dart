import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/account_widget.dart';
import 'package:ecommerce/widgets/app_top.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:ecommerce/widgets/height_space.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: "Profile",
          size: 24,
          color: Colors.white,
        ),
      ),
      body: Container(
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
                physics: BouncingScrollPhysics(),
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
                        text: "Bijay",
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
                        text: "9803005511",
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
                        text: "bijaysubbalimbu@gmail.com",
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
                        text: "Your Message is here !",
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
                        text: "Your Message is here !",
                      ),
                    ),

                    const HeightSpace(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
