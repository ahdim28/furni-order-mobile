import 'dart:collection';

import 'package:flutter/material.dart';

import '../models/product.dart';

class CartController extends ChangeNotifier {
  final List<ProductCartModel> _cartItems = [];

  UnmodifiableListView<ProductCartModel> get items => UnmodifiableListView(_cartItems);

  double get totalPrice {
    double totalPrice = 0;

    for (var item in _cartItems) {
      if (item.isChecked) {
        totalPrice += item.product.price * item.count;
      }
    }

    return totalPrice;
  }

  bool get areAllChecked => _cartItems.every((item) => item.isChecked);

  bool get noneChecked => _cartItems.every((item) => !item.isChecked);

  void add(ProductCartModel item) {
    // Check if the product is already in the cart.
    final index = _cartItems.indexWhere((cartItem) => cartItem.product.id == item.product.id);
    if (index != -1) {
      // If the product is already in the cart, increment its count.
      _cartItems[index] = ProductCartModel(
        product: _cartItems[index].product, 
        isChecked: _cartItems[index].isChecked, 
        count: _cartItems[index].count + 1
      );
    } else {
      // If the product is not in the cart, add it to the cart/
      _cartItems.add(item);
    }
    notifyListeners();
  }

  void selectSingleProduct(String productId, bool value) {
    final index = _cartItems.indexWhere((cartItem) => cartItem.product.id == productId);
    if (index != -1) {
      _cartItems[index] = ProductCartModel(
        product: _cartItems[index].product, 
        isChecked: value, 
        count: _cartItems[index].count
      );
    }
    notifyListeners();
  }

  void incrementProductCart(String productId) {
    final index = _cartItems.indexWhere((cartItem) => cartItem.product.id == productId);
    if (index != -1) {
      _cartItems[index] = ProductCartModel(
        product: _cartItems[index].product, 
        isChecked: _cartItems[index].isChecked, 
        count: _cartItems[index].count + 1
      );
    }
    notifyListeners();
  }

  void decrementProductCart(String productId) {
    final index = _cartItems.indexWhere((cartItem) => cartItem.product.id == productId);
    if (index != -1) {
      _cartItems[index] = ProductCartModel(
        product: _cartItems[index].product, 
        isChecked: _cartItems[index].isChecked, 
        count: _cartItems[index].count - 1
      );
    }
    notifyListeners();
  }

  void selectAll(bool value) {

  }

  void removeProduct(String productId) {
    final index = _cartItems.indexWhere((cartItem) => cartItem.product.id == productId);
    if (index != -1) {
      _cartItems.removeAt(index);
    }
    notifyListeners();
  }

  void selectOrUnselectAll(bool value) {
    for (var i = 0; i < _cartItems.length; i++) {
      _cartItems[i] = ProductCartModel(
        product: _cartItems[i].product, 
        isChecked: value, 
        count: _cartItems[i].count
      );
    }
    notifyListeners();
  }

  void purchase() {
    _cartItems.removeWhere((item) => item.isChecked);
    notifyListeners();
  }
}