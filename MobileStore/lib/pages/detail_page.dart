import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_provider.dart';
import '../widgets/product_provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Lấy ID của sản phẩm từ tham số của route
    final int productId = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        automaticallyImplyLeading: false, // Không tự động thêm nút back
        flexibleSpace: const Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Product Details',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              // lấy thông tin sản phẩm
              future: Provider.of<ProductProvider>(context, listen: false).fetchProductById(productId),
              builder: (context, snapshot) {
                //  hiển thị vòng quay chờ nếu đang chờ phản hồi từ API
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  // hiển thị thông báo lỗi nếu có lỗi
                  return const Center(child: Text('Error loading product'));
                } else {

                  return Consumer<ProductProvider>(
                    builder: (context, productProvider, child) {

                      final product = productProvider.selectedProduct;
                      // Nếu không tìm thấy sản phẩm, hiển thị thông báo lỗi
                      if (product == null) {
                        return const Center(child: Text('Product not found'));
                      }
                      //  chi tiết sản phẩm
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              //  hình ảnh sản phẩm
                              Center(
                                child: Image.network(
                                  product.imageUrl,
                                  width: double.infinity,
                                  height: 250,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(height: 16),
                              // tên sản phẩm
                              Text(
                                product.name,
                                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              //  mô tả sản phẩm
                              Text(product.description),
                              const SizedBox(height: 8),
                              // mã sản phẩm
                              const Text(
                                'Item Code: ',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                decoration: BoxDecoration(
                                  color: Colors.orange[300],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  '${product.id}',
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(height: 8),
                              // Hiển thị nhà sản xuất
                              Text(
                                'Manufacturer: ${product.manufacturer}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              // Hiển thị danh mục sản phẩm
                              Text(
                                'Category: ${product.category}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              // Hiển thị số lượng sản phẩm còn lại trong kho
                              Text(
                                'Available units in stock: ${product.quantity}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              // Hiển thị giá sản phẩm
                              Text(
                                'Price: ${product.price} USD',
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 16),
                              // Hiển thị các nút điều khiển
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context); // Quay lại trang trước đó
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text('Back', style: TextStyle(color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Provider.of<CartProvider>(context, listen: false)
                                            .addToCart(product); // Thêm sản phẩm vào giỏ hàng
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orange[300],
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text('Order Now', style: TextStyle(color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/'); // Điều hướng về trang chủ
          } else if (index == 1) {
            Navigator.pushNamed(context, '/cart'); // Điều hướng về trang giỏ hàng
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
