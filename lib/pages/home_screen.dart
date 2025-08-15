import 'package:flutter/material.dart';

import 'package:kicksy_kart/pages/product_list.dart';

import 'package:kicksy_kart/pages/shopping_cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  late int val = 0;
  Color iconColor = Colors.yellow;
  List<Widget> pages = [ProductList(), ShoppingCart()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentPage, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        iconSize: 35,
        selectedItemColor: iconColor,
        unselectedItemColor: Colors.grey,

        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
        ],
      ),
    );
  }
}
