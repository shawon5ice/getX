import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_getx/controllers/cart_controller.dart';

import '../controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);

  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(
              builder: (controller) {
                return ListView.builder(itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(controller.products[index].name),
                      subtitle: Text('\$${controller.products[index].price}'),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(
                                controller.products[index].isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                              ),
                              onPressed: () {
                                controller.toggleFavorite(controller.products[index]);
                                if(controller.products[index].isFavorite){
                                  cartController.addToFav(controller.products[index]);
                                }else{
                                  cartController.removeFormFav(controller.products[index]);
                                }
                              },
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.add_shopping_cart,
                              ),
                              onPressed: () {
                                cartController.addToCart(controller.products[index]);
                              },
                            ),
                          ],
                        ),
                      ),

                    ),
                  );
                },
                itemCount: controller.products.length,
                );
              }
            ),
          ),
          GetX<CartController>(
              builder: (controller) {
              return Text('Total Amount: ${controller.getTotalPrice()}');
            }
          ),
          const SizedBox(
            height: 200,
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/cart');
        },
        child: SizedBox(
          height: 50,
          width: 50,
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.center,
                  child:Icon(Icons.favorite_border)),
              Align(
                alignment: Alignment.topRight,
                child: GetX<CartController>(
                  builder: (controller) {
                    return CircleAvatar(
                      backgroundColor: Colors.yellow,
                      radius: 10,
                      child: Text(controller.favoriteItems.length.toString(),style: const TextStyle(color: Colors.black),),
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
