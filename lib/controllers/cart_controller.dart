import 'package:get/get.dart';

import '../models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  var favoriteItems = <Product>[].obs;

  void addToCart(Product product) {
    cartItems.add(product);
  }


  void removeFromCart(Product product) {
    cartItems.remove(product);
  }

  void addToFav(Product product) {
    favoriteItems.add(product);
  }

  void removeFormFav(Product product) {
    favoriteItems.remove(product);
  }

  double getTotalPrice() {
    double total = 0;
    for (var element in cartItems) {
      total += element.price;
    }
    return total;
  }
}