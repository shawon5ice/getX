import 'package:get/get.dart';

import '../models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  var favoriteItems = <Product>[].obs;

  int get favoriteCount => favoriteItems.length;

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

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


}