import 'package:flutter/material.dart';
import 'package:shopping_app/main.dart';
import 'package:shopping_app/view/mainscreen.dart';
import 'package:shopping_app/widgets/button.dart';

class Successful extends StatefulWidget {
  const Successful({super.key});

  @override
  State<Successful> createState() => _SuccessfulState();
}

class _SuccessfulState extends State<Successful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Placed Succefully'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
            // ignore: sized_box_for_whitespace
            child: Container(
          decoration: BoxDecoration(
              color: Colors.lightBlue.shade300,
              borderRadius: BorderRadius.circular(20)),
          height: MediaQuery.of(context).size.height * 0.5,
          width: 500,
          child: Card(
            color: Colors.lightBlue.shade200,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        var cart = cartItems[index];
                        return ListTile(
                          leading: Image.asset(cart.image),
                          title: Text(cart.name),
                          subtitle: Text(cart.details),
                          trailing: Text('\$${cart.price}'),
                        );
                      }),
                ),
                Button(
                    tap: () {
                      cartItems.clear();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainScreen()));
                    },
                    text: 'Close')
              ],
            ),
          ),
        )),
      ),
    );
  }
}
