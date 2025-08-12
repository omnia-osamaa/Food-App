import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int? _selectedCategoryIndex;
  String? _selectedCategory;
  String _searchQuery = '';

  int? get selectedCategoryIndex => _selectedCategoryIndex;
  String? get selectedCategory => _selectedCategory;
  String get searchQuery => _searchQuery;

  void selectCategory(int index, String? category) {
    _selectedCategoryIndex = index;
    _selectedCategory = category;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void clearSearchQuery() {
    _searchQuery = '';
    notifyListeners();
  }
}
