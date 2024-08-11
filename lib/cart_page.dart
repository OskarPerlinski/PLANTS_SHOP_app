import 'package:flutter/material.dart';
import 'package:plant_shop_app/models.dart';
import 'package:plant_shop_app/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  void removeFromCart(Plants plants, BuildContext context) {
    final shop = context.read<Shop>();
    shop.removeFromCart(plants);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.brown,
        appBar: AppBar(
          title: const Text(
            "My Cart",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.brown,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  final Plants plants = value.cart[index];
                  final String plantsName = plants.name;
                  final String plantsPrice = plants.price;
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.green[600],
                        borderRadius: BorderRadius.circular(8)),
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: ListTile(
                      title: Text(
                        plantsName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      subtitle: Text(
                        plantsPrice,
                        style: TextStyle(color: Colors.grey[200]),
                      ),
                      trailing: IconButton(
                          onPressed: () => removeFromCart(plants, context),
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          )),
                    ),
                  );
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green[600],
                    borderRadius: BorderRadius.circular(40),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.all(20),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Pay Now",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
