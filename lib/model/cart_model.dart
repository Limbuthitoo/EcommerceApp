import 'package:ecommerce/model/products_model.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  int? quantity;
  String? img;
  bool? isExist;
  String? time;
  ProductModel? product;
  CartModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.time,
    this.isExist,
    this.product,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    time = json['time'];
    isExist = json['isExist'];
    product = ProductModel.fromJson(json['product']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "price": this.price,
      "img": this.img,
      "quantity": this.quantity,
      "time": this.time,
      "isExist": this.isExist,
      "product": this.product!.toJson()
    };
  }
}
