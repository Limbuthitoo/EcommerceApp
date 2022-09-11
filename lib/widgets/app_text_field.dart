import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  final TextInputType keys;
  const AppTextField(
      {Key? key,
      required this.hintText,
      required this.icon,
      required this.textController,
      required this.keys})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: Dimensions.height20, right: Dimensions.height20),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 7,
                offset: Offset(1, 1),
                color: Colors.grey.withOpacity(0.2))
          ],
          borderRadius: BorderRadius.circular(Dimensions.radius30)),
      child: TextField(
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
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            borderSide: BorderSide(width: 1.0, color: Colors.white),
          ),

          //enabledBorder
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            borderSide: BorderSide(width: 1.0, color: Colors.white),
          ),
          //border
        ),
      ),
    );
  }
}
