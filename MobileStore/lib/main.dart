import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mock_project/pages/cart_page.dart';
import 'package:mock_project/pages/detail_page.dart';
import 'package:mock_project/pages/home_page.dart';
import 'package:mock_project/widgets/cart_provider.dart';
import 'package:mock_project/widgets/product_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Đăng ký các provider cho quản lý trạng thái
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Mobile Store App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/', // Đường dẫn khởi đầu của ứng dụng
        routes: {
          // Định nghĩa các đường dẫn cho điều hướng
          '/': (context) => const HomePage(),
          '/detail': (context) => const DetailPage(),
          '/cart': (context) => const CartPage(),
        },
      ),
    );
  }
}
