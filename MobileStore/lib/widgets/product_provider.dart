import 'package:flutter/material.dart';
import '../models/api_service.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  Product? _selectedProduct;
  bool _isFetching = false;
  bool _isFetchingDetail = false; // Trạng thái lấy chi tiết sản phẩm

  List<Product> get products => _products;
  Product? get selectedProduct => _selectedProduct;
  bool get isFetching => _isFetching;
  bool get isFetchingDetail => _isFetchingDetail;

  Future<void> fetchProducts() async {
    if (_products.isEmpty && !_isFetching) {
      _isFetching = true;
      notifyListeners();
      try {
        _products = await ApiService().fetchProducts();
        print('Products: $_products');
      } catch (error) {
        print('Error fetching products: $error');
      } finally {
        _isFetching = false;
        notifyListeners();
      }
    }
  }

  Future<void> fetchProductById(int id) async {
    _isFetchingDetail = true;
    notifyListeners();
    try {
      _selectedProduct = await ApiService().fetchProductById(id);
      print('Selected Product: $_selectedProduct');
    } catch (error) {
      print('Error fetching product by id: $error');
    } finally {
      _isFetchingDetail = false;
      notifyListeners();
    }
  }
}
