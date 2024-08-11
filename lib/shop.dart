// ignore_for_file: non_constant_identifier_names, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:plant_shop_app/models.dart';

class Shop extends ChangeNotifier {
  final List<Plants> _Plantsmenu = [
    Plants(
        name: "Mae",
        price: "60.00",
        imagePath: "images/mae.png",
        raiting: "4.8"),
    Plants(
        name: "Dracaena",
        price: "25.00",
        imagePath: "images/dracaena2.png",
        raiting: "4.9"),
    Plants(
        name: "Ziggy",
        price: "20.00",
        imagePath: "images/ziggy1.png",
        raiting: "4.7"),
    Plants(
        name: "Chaz",
        price: "19.00",
        imagePath: "images/chaz.png",
        raiting: "4.9"),
    Plants(
        name: "Phoebe",
        price: "30.00",
        imagePath: "images/phoebe.png",
        raiting: "4.6"),
    Plants(
        name: "Wallace",
        price: "35.00",
        imagePath: "images/Wallace.png",
        raiting: "4.9")
  ];

  List<Plants> _cart = [];
  List<Plants> get cart => _cart;
  List<Plants> get Plantsmenu => _Plantsmenu;

  void addToCart(Plants plantsItem, int quanity) {
    for (int i = 0; i < quanity; i++) {
      _cart.add(plantsItem);
    }
    notifyListeners();
  }

  void removeFromCart(Plants plants) {
    _cart.remove(plants);
    notifyListeners();
  }
}
