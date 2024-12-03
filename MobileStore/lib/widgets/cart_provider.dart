import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  // Sử dụng Map để lưu trữ sản phẩm và số lượng của chúng
  Map<Product, int> _cartItems = {};

  Map<Product, int> get cartItems => _cartItems;

  // Thêm sản phẩm vào giỏ hàng
  void addToCart(Product product) {
    if (_cartItems.containsKey(product)) {
      _cartItems[product] = _cartItems[product]! + 1;
    } else {
      _cartItems[product] = 1;
    }
    notifyListeners();
  }

  // Xóa một sản phẩm khỏi giỏ hàng
  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  // Xóa toàn bộ giỏ hàng
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  // Tính tổng giá trị giỏ hàng
  double get totalPrice {
    return _cartItems.entries
        .map((entry) => entry.key.price * entry.value)
        .fold(0.0, (sum, element) => sum + element);
  }

  // Lấy danh sách chi tiết đơn hàng
  List<Map<String, dynamic>> get orderDetails {
    return _cartItems.entries.map((entry) {
      return {
        "productId": entry.key.id,
        "quantity": entry.value,
        "unitPrice": entry.key.price,
      };
    }).toList();
  }
}
