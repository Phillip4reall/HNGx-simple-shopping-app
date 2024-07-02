import 'package:flutter/material.dart';
import 'package:shopping_app/view/checkout_page.dart';
import 'package:shopping_app/view/productpage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pages = const [ProductPage(), Checkout()];
  int pageindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.lightBlue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          currentIndex: pageindex,
          onTap: (index) {
            setState(() {
              pageindex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Product'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: 'Checkout'),
          ]),
      body: pages[pageindex],
    );
  }
}
