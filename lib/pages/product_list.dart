import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kicksy_kart/global_variables.dart';
import 'package:kicksy_kart/pages/product_card.dart';
import 'package:kicksy_kart/pages/product_screen.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> items = const ["All", "Nike", "Adidas", "Bata", "Reebok"];
  late String selectedFilter;
  Color backgroundColour = Colors.grey.shade100;
  int bottomIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedFilter = items[0];
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
      borderSide: BorderSide(color: Colors.grey),
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Shoes\nCollection',
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 42,
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: border,
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Colors.grey,
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: border,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 8),
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final filter =
                      items[index]; // iske ander values hai like nike,bata,all
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter =
                              filter; // selected filter ki value update hoke hojaegi to selected one
                        });
                      },
                      child: Chip(
                        side: BorderSide(color: backgroundColour),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(24),
                        ),

                        backgroundColor:
                            selectedFilter ==
                                filter // yahan pe check hoga ki if selected filter toh yellow
                            ? Theme.of(context).primaryColor
                            : backgroundColour,
                        label: Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 8,
                            bottom: 2,
                          ),
                          child: Text(items[index]),
                        ),
                        labelStyle: TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductScreen(product: product),
                        ),
                      );
                    },
                    child: ProductCard(
                      title: product['title'] as String,
                      price: product['price'] as double,
                      productImage: product['imageUrl'] as String,
                      productCardColor: index % 2 == 0
                          ? Color.fromRGBO(216, 240, 253, 1)
                          : Colors.white,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
