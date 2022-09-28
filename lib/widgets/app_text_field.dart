import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  final TextInputType keys;
  bool isObscure;
  AppTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.textController,
    required this.keys,
    this.isObscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: Dimensions.height20, right: Dimensions.height20),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 3,
                spreadRadius: 1,
                offset: Offset(1, 1),
                color: Colors.grey.withOpacity(0.2))
          ],
          borderRadius: BorderRadius.circular(Dimensions.radius15)),
      child: TextField(
        obscureText: isObscure ? true : false,
        keyboardType: keys,
        controller: textController,
        decoration: InputDecoration(
          //hintText,
          hintText: hintText,
          //prefixIcon
          prefixIcon: Icon(
            icon,
            color: AppColors.mainColor,
          ),

          //focusedBorder
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius15),
            borderSide: BorderSide(width: 1.0, color: Colors.white),
          ),

          //enabledBorder
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius15),
            borderSide: BorderSide(width: 1.0, color: Colors.white),
          ),
          //border
        ),
      ),
    );
  }
}
