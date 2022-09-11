import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/app_text_field.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:ecommerce/widgets/height_space.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = ['t.png', 'f.png', 'g.png'];
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),
            Container(
              height: Dimensions.screenHeight * 0.25,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: Dimensions.radius20 * 4,
                  backgroundImage: AssetImage(
                    "assets/images/logo1.png",
                  ),
                ),
              ),
            ),

            //email text field
            AppTextField(
                keys: TextInputType.emailAddress,
                hintText: "Email",
                icon: Icons.email,
                textController: emailController),
            SizedBox(
              height: Dimensions.height20,
            ),

            //password text field
            AppTextField(
                keys: TextInputType.visiblePassword,
                hintText: "Password",
                icon: Icons.password,
                textController: passwordController),
            SizedBox(
              height: Dimensions.height20,
            ),

            //name text field
            AppTextField(
                keys: TextInputType.name,
                hintText: "Name",
                icon: Icons.person,
                textController: nameController),
            SizedBox(
              height: Dimensions.height20,
            ),

            //phone text field
            AppTextField(
                keys: TextInputType.number,
                hintText: "Phone",
                icon: Icons.phone,
                textController: phoneController),
            SizedBox(
              height: Dimensions.height30,
            ),

            Container(
              width: Dimensions.screenWidth / 2,
              height: Dimensions.screenHeight / 13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: AppColors.mainColor,
              ),
              child: Center(
                child: BigText(
                  text: "Sign Up",
                  color: Colors.white,
                  size: Dimensions.font10 + Dimensions.font20 / 2,
                ),
              ),
            ),
            HeightSpace(),
            //tagline
            RichText(
              text: TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = (() => Get.back()),
                  text: "Have an account already?",
                  style: TextStyle(
                      color: Colors.grey[500], fontSize: Dimensions.font20)),
            ),

            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),

            //sign up options
            RichText(
              text: TextSpan(
                  text: "Sign up using one of the following methods",
                  style: TextStyle(
                      color: Colors.grey[500], fontSize: Dimensions.font16)),
            ),

            Wrap(
              children: List.generate(
                  3,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: Dimensions.radius30,
                          backgroundImage: AssetImage(
                              "assets/images/" + signUpImages[index]),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
