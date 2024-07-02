// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:shopping_app/main.dart';
import 'package:shopping_app/model/productmodel.dart';
import 'package:shopping_app/view/order_succeful.dart';
import 'package:shopping_app/widgets/custumbutton.dart';

class Checkout extends StatefulWidget {
  const Checkout({
    super.key,
  });

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  double totall() {
    double total = 0;
    for (Productmodel product in cartItems) {
      total += product.quality * product.price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
              ),
              Text(
                'My Carts',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.density_medium_outlined,
                size: 20,
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final cart = cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 130,
                        color: Colors.lightBlue.shade100,
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white30,
                                          shape: BoxShape.rectangle),
                                      child: Image.asset(
                                        cart.image,
                                        //height: 150,
                                        //width: 150,
                                        scale: 1,
                                      ))),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  cart.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '\$${cart.price}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        // height: ,
                                        width: 130,
                                        decoration: const BoxDecoration(
                                            color: Colors.lightBlue,
                                            shape: BoxShape.rectangle),
                                        child: Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                if (cartItems[index].quality ==
                                                    0) return;
                                                setState(() {
                                                  cartItems[index].quality -= 1;
                                                });
                                              },
                                              icon: Icon(
                                                Icons.expand_less,
                                                size: 30,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              cartItems[index]
                                                  .quality
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  cartItems[index].quality += 1;
                                                });
                                              },
                                              icon: Icon(
                                                Icons.expand_more,
                                                size: 30,
                                                color: Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            cartItems.remove(cartItems[index]);
                                          });
                                        },
                                        icon: Icon(Icons.delete))
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //'Total:'
              Text(
                'Total:',
                //'${control.carts['name']}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 40,
              ),
              Text(
                '\$${totall()}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Custombutton(
              height: 50,
              widht: double.infinity,
              ontap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Successful()));
              },
              text: 'CHECK OUT',
            ),
          ),
        ]),
      )),
    );
  }
}
