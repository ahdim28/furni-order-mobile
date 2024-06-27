import 'dart:collection';

import 'package:flutter/material.dart';

import '../models/product.dart';

class CartController extends ChangeNotifier {
  final List<ProductCartModel> _cartItems = [];

  UnmodifiableListView<ProductCartModel> get items => UnmodifiableListView(_cartItems);

  double get totalPrice {
    double totalPrice = 0;

    for (var item in _cartItems) {

      double price = item.product.price;
      if (item.product.discountPercentage != null) {
        price = (item.product.price - (item.product.price * item.product.discountPercentage!/100));
      }

      if (item.isChecked) {
        totalPrice += price * item.count;
      }
    }

    return totalPrice;
  }

  bool get areAllChecked => _cartItems.every((item) => item.isChecked);
  bool get noneChecked => _cartItems.every((item) => !item.isChecked);

  void add(ProductCartModel item) {
    // cek jika produk sudah ada di keranjang
    final index = _cartItems.indexWhere((cartItem) => cartItem.product.id == item.product.id);
    if (index != -1) {
      // jika produk sudah ada maka tambakan qtynya saja
      _cartItems[index] = ProductCartModel(
        product: _cartItems[index].product, 
        isChecked: _cartItems[index].isChecked, 
        count: _cartItems[index].count + 1
      );
    } else {
      // jika produk belum ada di keranjang maka tambahkan
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