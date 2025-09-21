import 'package:flutter/material.dart';
import 'package:resto/screens/home_page.dart';
void main() {
  runApp(RestoShop());
}
class RestoShop extends StatelessWidget {
  const RestoShop({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Suwannaphum',
      ),
      debugShowCheckedModeBanner: false,
      home: RestoShopHomePage(),
    );
  }
}