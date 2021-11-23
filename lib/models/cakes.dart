import 'package:flutter/material.dart';

class ProductModel {
  final String? img;
  final String? name;
  final Color? bcolor;
  final String? price;

  ProductModel({this.price, this.name, this.img, this.bcolor});
}

List<ProductModel> productItems = [
  ProductModel(
    price: '16',
    name: 'Ice Cream Cerry',
    img: 'assets/ccake.png',
    bcolor: const Color(0xFFC98A81),
  ),
  ProductModel(
    price: '18',
    name: 'Red Velvet Desert',
    img: 'assets/stcake.png',
    bcolor: const Color(0xffFF9a8a),
  ),
  ProductModel(
    price: '16',
    name: 'Ice Cream Cerry',
    img: 'assets/cccake.png',
    bcolor: const Color(0xFFffc4b2),
  ),
  ProductModel(
    price: '16',
    name: 'Red Velvet Desert',
    img: 'assets/stcake.png',
    bcolor: const Color(0xFFC98A81),
  ),
];
