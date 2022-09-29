import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final Function() ontap;

  SearchTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height20 * 3,
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
          borderRadius: BorderRadius.circular(Dimensions.radius30)),
      child: TextField(
        decoration: InputDecoration(
          //hintText,
          hintText: hintText,
          //prefixIcon
          suffixIcon: GestureDetector(
            onTap: ontap,
            child: Icon(
              icon,
              color: AppColors.mainColor,
            ),
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
