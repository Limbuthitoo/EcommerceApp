import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widgets/big_text.dart';
import 'package:ecommerce/widgets/icon_and_text_widget.dart';
import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class AppCommentRating extends StatelessWidget {
  final String text;
  const AppCommentRating({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Product Name
          BigText(
            text: text,
            size: Dimensions.font26,
          ),
          SizedBox(
            height: Dimensions.height10,
          ),

          //comment Section
          Row(
            children: [
              Wrap(
                children: List.generate(
                  5,
                  (index) => Icon(Icons.star,
                      color: AppColors.mainColor, size: Dimensions.iconSize15),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SmallText(text: "4.5"),
              const SizedBox(
                width: 10,
              ),
              SmallText(text: "1287"),
              const SizedBox(
                width: 10,
              ),
              SmallText(text: "comments"),
            ],
          ),
          SizedBox(
            height: Dimensions.height20,
          ),

          //Product quality and location pin
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconAndTextWidget(
                  icon: Icons.circle_sharp,
                  text: "Normal",
                  iconColor: AppColors.iconColor1),
              IconAndTextWidget(
                  icon: Icons.location_on,
                  text: "1.5km",
                  iconColor: AppColors.mainColor),
              IconAndTextWidget(
                  icon: Icons.access_time_rounded,
                  text: "25min",
                  iconColor: AppColors.iconColor2),
            ],
          )
        ],
      ),
    );
  }
}
