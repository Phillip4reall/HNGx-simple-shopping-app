// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:shopping_app/main.dart';
import 'package:shopping_app/model/productmodel.dart';
import 'package:shopping_app/widgets/button.dart';
import 'package:shopping_app/widgets/text_font.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    super.key,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Productmodel> products = [
    Productmodel(
        name: 'Balenciaga',
        price: 250,
        details: 'Female luxury balenciaga bag',
        image: 'images/bag1.png'),
    Productmodel(
        name: 'Channel',
        price: 450,
        details: 'Good quality bag for female',
        image: 'images/bag2.png'),
    Productmodel(
        name: 'Female Bag',
        price: 120,
        details: 'A female bag for different Owanbe',
        image: 'images/bag3.png'),
    Productmodel(
        name: 'Fendi Bag',
        price: 140,
        details: 'A quality female and good quality bag',
        image: 'images/bag4.png'),
    Productmodel(
        name: 'Hermes Bag',
        price: 300,
        details: 'quality hermes bag',
        image: 'images/bag5.png'),
    Productmodel(
        name: 'Gucci Bag',
        price: 290,
        details: 'Gucci Jumbo GG Bamboo',
        image: 'images/bag6.png'),
    // Productmodel(name: '', price: 30, details: '', image: ''),
    // Productmodel(name: '', price: 30, details: '', image: ''),
    // Productmodel(name: '', price: 30, details: '', image: ''),
    //Productmodel(name: '', price: 30, details: '', image: ''),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add items to cart'),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        surfaceTintColor: Colors.green,
                        margin: const EdgeInsets.all(10),
                        elevation: 0,
                        color: Colors.lightBlue,
                        shadowColor: Colors.green,
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                //statitis
                                Row(
                                  children: [
                                    Container(
                                      height: 100,
                                      child: Image.asset(
                                        products[index].image,
                                        height: 90,
                                        width: 100,
                                        //scale: 2,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          products[index].name,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          textDirection: TextDirection.rtl,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          products[index].details,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                        Text(
                                          '\$${products[index].price}',
                                          style: const TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    //Spacer(),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Button(
                                        tap: () async {
                                          Productmodel product = Productmodel(
                                              name: products[index].name,
                                              price: products[index].price,
                                              details: products[index].details,
                                              image: products[index].image);

                                          if (cartItems.contains(product)) {
                                            return;
                                          }

                                          setState(() {
                                            cartItems.add(product);
                                          });

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  backgroundColor: Colors.green,
                                                  content: Text(
                                                    'Product Added Succefully',
                                                    style: textfont(
                                                        Colors.white,
                                                        18,
                                                        FontWeight.bold),
                                                  )));
                                        },
                                        text: 'Add to cart'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ]),
                      );
                    }))));
  }
}
