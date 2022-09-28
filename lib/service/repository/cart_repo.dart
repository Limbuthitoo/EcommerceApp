import 'dart:convert';

import 'package:ecommerce/model/cart_model.dart';
import 'package:ecommerce/utils/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {
    /* Removing all data from local storage */
    // sharedPreferences.remove(AppConstants.CART_LIST);
    // sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);

    var time = DateTime.now().toString();
    cart = [];

    /*  
    Convert objects to string because sheredpreference only accepts string
      */
    cartList.forEach((element) {
      element.time = time;
      return cart.add(jsonEncode(element));
    });

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    // print(sharedPreferences.getStringList(AppConstants.CART_LIST));
    // getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      // print("inside getCartList" + carts.toString());
    }
    List<CartModel> cartList = [];
/* //Example
List<Object> list=[
  "object1",
  "object2",
  "object3"
] */
    carts.forEach(
        (element) => cartList.add(CartModel.fromJson(jsonDecode(element))));

    return cartList;
  }

  List<CartModel> getCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      cartHistory = [];
      cartHistory =
          sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    List<CartModel> cartListHistory = [];
    cartHistory.forEach((element) =>
        cartListHistory.add(CartModel.fromJson(jsonDecode(element))));
    return cartListHistory;
  }

  void addToCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      cartHistory =
          sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    for (int i = 0; i < cart.length; i++) {
      //print("History List" + cart[i]);
      cartHistory.add(cart[i]);
    }
    removeCart();

    sharedPreferences.setStringList(
        AppConstants.CART_HISTORY_LIST, cartHistory);

    print("the length of history list is" +
        getCartHistoryList().length.toString());

    for (int j = 0; j < getCartHistoryList().length; j++) {
      print("The time for the order is" +
          getCartHistoryList()[j].time.toString());
    }
  }

  void removeCart() {
    cart = [];
    sharedPreferences.remove(AppConstants.CART_LIST);
  }

  void clearCartHistory() {
    removeCart();
    cartHistory = [];
    sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
  }
}
