import 'package:flutter/material.dart';
import 'food_item.dart';

class FavoritesModel extends ChangeNotifier {
  final Map<FoodItem, int> _favorites = {};

  Map<FoodItem, int> get items => _favorites;

  void addFavorite(FoodItem item) {
    if (_favorites.containsKey(item)) {
      // Optional: Handle multiple additions if needed
      _favorites[item] = _favorites[item]! + 1;
    } else {
      _favorites[item] = 1;
    }
    notifyListeners();
  }

  void removeFavorite(FoodItem item) {
    if (_favorites.containsKey(item)) {
      _favorites.remove(item);
      notifyListeners();
    }
  }

  bool isFavorite(FoodItem item) {
    return _favorites.containsKey(item);
  }

  void clearFavorites() {
    _favorites.clear();
    notifyListeners();
  }
}
