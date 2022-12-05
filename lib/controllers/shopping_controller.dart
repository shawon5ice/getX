import 'package:get/get.dart';
import 'package:learning_getx/models/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async{
    await Future.delayed(const Duration(seconds: 1));
    var productResult = <Product>[
      Product(
        id: 1,
        name: 'Product 1',
        price: 5.99,
        description: 'Description for Product 1',
      ),
      Product(
        id: 2,
        name: 'Product 2',
        price: 6.99,
        description: 'Description for Product 2',
      ),
      Product(
        id: 3,
        name: 'Product 3',
        price: 7.99,
        description: 'Description for Product 3',
      ),
    ];
    products.value = productResult;
  }

  void toggleFavorite(Product product) {
    product.isFavorite = !product.isFavorite;
    products.refresh();
  }
}