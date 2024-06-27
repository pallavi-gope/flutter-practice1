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
    {
      "subtitle": "LuxeLiving New",
      "name": "Arm Chair New",
      "image": "assets/product2.jpg",
      "price": 59,
      "qty": 1,
    },
  ];

  int totalItems() {
    int totalQty = 0;
    for (var product in products) {
      totalQty += product['qty'] as int;
    }
    return totalQty;
  }

  void increaseQty(int index) {
    products[index]['qty']++;
    notifyListeners();
  }

  void decreaseQty(int index) {
    if (products[index]['qty'] > 1) {
      products[index]['qty']--;
      notifyListeners();
    }
  }
}
