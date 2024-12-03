import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mock_project/models/product.dart';

class ApiService {
  final String baseUrl = "http://192.168.1.62:8080";

  //  lấy danh sách sản phẩm từ API
  Future<List<Product>> fetchProducts() async {
    // Gửi yêu cầu GET đến API
    final response = await http.get(Uri.parse('$baseUrl/api/v1/products'));

    // check phản hồi thành công
    if (response.statusCode == 200) {
      // Chuyển đổi  JSON thành  Product
      List<dynamic> jsonResponse = json.decode(response.body);
      // chuyển đổi  danh sách JSON thành đối tượng Product
      return jsonResponse.map((product) => Product.fromJson(product)).toList();
    } else {
      //  ngoại lệ nếu không lấy được dữ liệu
      throw Exception('Failed to load products');
    }
  }

  //  lấy thông tin chi tiết sản phẩm từ API dựa vào ID
  Future<Product> fetchProductById(int id) async {
    // Gửi yêu cầu GET đến API với ID của sản phẩm
    final response = await http.get(Uri.parse('$baseUrl/api/v1/products/$id'));

    // Kiểm tra nếu phản hồi thành công
    if (response.statusCode == 200) {
      // Chuyển đổi  JSON thành oduct và trả về
      return Product.fromJson(json.decode(response.body));
    } else {
      // ngoại lệ nếu không lấy được dữ liệu
      throw Exception('Failed to load product');
    }
  }
}
