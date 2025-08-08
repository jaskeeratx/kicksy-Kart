import 'dart:ffi';

import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String productImage;
  final Color productCardColor;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.productImage,
    required this.productCardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      color: productCardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 5),
            Text('\$$price', style: Theme.of(context).textTheme.bodySmall),
            SizedBox(height: 5),
            Center(child: Image(height: 175, image: AssetImage(productImage))),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
