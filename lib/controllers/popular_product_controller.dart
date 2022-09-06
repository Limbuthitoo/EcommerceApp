import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/model/products_model.dart';
import 'package:ecommerce/service/repository/popular_product_repo.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _quantity = 0;
  int get quaintity => _quantity;
  int _intCartItems = 0;
  int get intCartItems => _intCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_intCartItems + quantity) < 0) {
      Get.snackbar(
        "Item count",
        "You can't reduce more !",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    } else if ((_intCartItems + quantity) > 15) {
      Get.snackbar(
        "Item count",
        "You can't add more !",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 15;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _intCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    //if exist
    //get from storage _inCartItems=3
    print("exist or not" + exist.toString());
    if (exist) {
      _intCartItems = _cart.getQuantity(product);
    }
    print("the quantity in the cart is" + _intCartItems.toString());
  }

  void addItem(ProductModel product) {
    // if (_quantity > 0) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _intCartItems = _cart.getQuantity(product);

    _cart.items.forEach((key, value) {
      print("This id is" +
          value.id.toString() +
          "the quantity is" +
          value.quantity.toString());
    });
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }
}
