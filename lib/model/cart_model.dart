import 'package:flutter/material.dart';
import 'food_item.dart';

class CartModel extends ChangeNotifier {
  final Map<FoodItem, int> _items = {};

  Map<FoodItem, int> get items => _items;

  void addItem(FoodItem item, {int quantity = 1}) {
    if (_items.containsKey(item)) {
      _items[item] = _items[item]! + quantity;
    } else {
      _items[item] = quantity;
    }
    notifyListeners();
  }

  void removeItem(FoodItem item) {
    if (_items.containsKey(item)) {
      if (_items[item]! > 1) {
        _items[item] = _items[item]! - 1;
      } else {
        _items.remove(item);
      }
      notifyListeners();
    }
  }

  double get totalCost => _items.entries.fold(
        0,
        (sum, entry) => sum + (entry.key.price * entry.value),
      );

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
