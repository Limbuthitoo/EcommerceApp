import 'package:ecommerce/base/custom_loader.dart';
import 'package:ecommerce/base/show_custom_message.dart';
import 'package:ecommerce/controllers/auth_controller.dart';
import 'package:ecommerce/routes/route_helper.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/view/auth/signup_page.dart';
import 'package:ecommerce/widgets/app_text_field.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:ecommerce/widgets/height_space.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    void _login(AuthController authController) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty) {
        showCustomMessage("Type in your email address", title: "Email");
      } else if (!GetUtils.isEmail(email)) {
        showCustomMessage("Type in your valid email address",
            title: "Valid email address");
      } else if (password.isEmpty) {
        showCustomMessage("Type in your password", title: "Password");
      } else if (password.length < 6) {
        showCustomMessage("Password cannot be less than six characters",
            title: "Password");
      } else {
        authController.login(email, password).then((status) {
          if (status.isSuccess) {
            Get.offNamed(RouteHelper.getCartPage());
          } else {
            showCustomMessage(status.message);
          }
        });
      }
    }

    return Scaffold(body: GetBuilder<AuthController>(
      builder: (authController) {
        return !authController.isLoading
            ? SingleChildScrollView(
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

                    //Welcome
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(left: Dimensions.width20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello",
                            style: TextStyle(
                                fontSize: Dimensions.font20 * 3 +
                                    Dimensions.font20 / 2,
                                fontWeight: FontWeight.bold),
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Sign into your account",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: Dimensions.font20),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    //phone text field
                    AppTextField(
                        keys: TextInputType.emailAddress,
                        hintText: "email",
                        icon: Icons.phone,
                        textController: emailController),
                    SizedBox(
                      height: Dimensions.height20,
                    ),

                    //password text field
                    AppTextField(
                        isObscure: true,
                        keys: TextInputType.visiblePassword,
                        hintText: "Password",
                        icon: Icons.password,
                        textController: passwordController),
                    HeightSpace(),
                    Padding(
                      padding: EdgeInsets.all(Dimensions.width15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RichText(
                            text: TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = (() => Get.back()),
                                text: "Forgor your password?",
                                style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: Dimensions.font16)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    GestureDetector(
                      onTap: () {
                        _login(authController);
                      },
                      child: Container(
                        width: Dimensions.screenWidth / 2,
                        height: Dimensions.screenHeight / 13,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius30),
                          color: AppColors.mainColor,
                        ),
                        child: Center(
                          child: BigText(
                            text: "Sign In",
                            color: Colors.white,
                            size: Dimensions.font10 + Dimensions.font20 / 2,
                          ),
                        ),
                      ),
                    ),
                    HeightSpace(),
                    //tagline
                    SizedBox(
                      height: Dimensions.screenHeight * 0.05,
                    ),

                    //sign up options
                    RichText(
                      text: TextSpan(
                        text: "Don\'t have an account?",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font16),
                        children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = (() => Get.to(() => SignupPage(),
                                    transition: Transition.fade)),
                              text: " Create",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.font16))
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : CustomLoader();
      },
    ));
  }
}
