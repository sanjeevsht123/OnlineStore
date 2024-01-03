import 'package:onlinestore/Products/Models/product_model.dart';

class cartModel{
  final int id;
  final ProductModel product;
  int quantity;

  cartModel({required this.id, required this.product, required this.quantity});

}