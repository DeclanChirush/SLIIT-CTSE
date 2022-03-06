import 'package:flutter/material.dart';
import '../data.dart';

class CartProvider extends ChangeNotifier {
  final Set<Item> _item = {};

  Set<Item> get item => _item;

  double get total =>
      _item.fold(0.0, (previousValue, item) => previousValue + item.price);

  bool isItemAdded(Item item) {
    return _item.contains(item);
  }

  void addItem(Item item) {
    _item.add(item);
    notifyListeners();
  }

  void removeItem(Item item) {
    _item.remove(item);
    notifyListeners();
  }
}