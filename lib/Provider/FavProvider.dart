import 'package:digitalmenu/Model/FoodModel.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Food> _favoriteFoods = [];

  List<Food> get favoriteFoods => _favoriteFoods;

  void toggleFavorite(Food food) {
    if (_favoriteFoods.contains(food)) {
      _favoriteFoods.remove(food);
    } else {
      _favoriteFoods.add(food);
    }
    notifyListeners();
  }

  bool isFavorite(Food food) {
    return _favoriteFoods.contains(food);
  }
}
