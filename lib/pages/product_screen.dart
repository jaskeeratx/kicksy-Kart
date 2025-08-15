import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kicksy_kart/global_variables.dart';

class ProductScreen extends StatefulWidget {
  final Map<String, Object> product;
  const ProductScreen({super.key, required this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late int selectedSize = 0;
  Color backgroundColour = Colors.grey.shade100;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details", style: Theme.of(context).textTheme.bodySmall),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              widget.product['title'] as String,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image(
                image: AssetImage(widget.product['imageUrl'] as String),
              ),
            ),
            Spacer(flex: 2),
            Container(
              height: 250,
              color: Colors.grey.shade100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '44.84\$',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final size =
                            (widget.product['sizes'] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            child: Chip(
                              label: Text(size.toString()),
                              color: selectedSize == index
                                  ? WidgetStatePropertyAll(
                                      CupertinoColors.systemYellow,
                                    )
                                  : WidgetStatePropertyAll(backgroundColour),
                            ),
                            onTap: () {
                              setState(() {
                                selectedSize = index;
                              });
                            },
                          ),
                        );
                      },
                      itemCount: (widget.product['sizes'] as List<int>).length,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Add to cart'),
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.amberAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
