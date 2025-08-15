import 'package:flutter/material.dart';

import 'package:kicksy_kart/pages/cart_provider.dart';
import 'package:provider/provider.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              ),
              trailing: IconButton(
                onPressed: () {
                  Provider.of<CartProvider>(context).removeProduct(cartItem);
                },
                icon: Icon(Icons.delete, color: Colors.red),
              ),
              title: Text(
                cartItem['title'] as String,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              subtitle: Text('Size ${cartItem['sizes']}'),
            );
          },
        ),
      ),
    );
  }
}
