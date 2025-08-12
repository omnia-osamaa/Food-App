import 'package:digitalmenu/Model/FoodModel.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Food> _cartItems = [];

  List<Food> get cartItems => _cartItems;

  void addToCart(Food food) {
    _cartItems.add(food);
    notifyListeners();
  }

  void removeFromCart(Food food) {
    _cartItems.remove(food);
    notifyListeners();
  }

  int getTotalPrice() {
    return _cartItems.fold(0, (sum, item) => sum + item.price);
  }
}
