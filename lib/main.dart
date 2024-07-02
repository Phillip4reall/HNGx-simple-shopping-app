// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:shopping_app/model/productmodel.dart';
import 'package:shopping_app/view/mainscreen.dart';
import 'package:shopping_app/widgets/text_font.dart';

void main() {
  runApp(const MyApp());
}

List<Productmodel> cartItems = [];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) =>
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) => const MainScreen()))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to HNGx Intership',
                style: textfont(Colors.white, 25, FontWeight.bold),
              ),
              Text(
                'Shopping App',
                style: textfont(Colors.white, 25, FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
