import 'package:ecommerce/utils/dimensions.dart';
import 'package:flutter/material.dart';

class HeightSpace extends StatelessWidget {
  const HeightSpace({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height10,
    );
  }
}
