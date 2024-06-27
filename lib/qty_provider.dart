import 'package:flutter/material.dart';

class QtyProvider extends ChangeNotifier {
  List products = [
    {
      "subtitle": "Sofasculpt",
      "name": "Comfy Chair",
      "image": "assets/product1.jpg",
      "price": 39,
      "qty": 1,
    },
    {
      "subtitle": "TimberTrove",
      "name": "Plywood Chair",
      "image": "assets/product2.jpg",
      "price": 29,
      "qty": 1,
    },
    {
      "subtitle": "LuxeLiving",
      "name": "Arm Chair",
      "image": "assets/product3.jpg",
      "price": 49,
      "qty": 1,
    },
  ];

  int sumQuantities(int sum, item){
    return sum + item['qty'] as int;
  }
  int get totalItems => products.fold(0, sumQuantities);

  void increaseQty(int index) {
    products[index]['qty']++;
    notifyListeners();
  }

  void decreaseQty(int index) {
    products[index]['qty']--;
    notifyListeners();
  }
}
