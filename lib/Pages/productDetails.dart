import 'package:flutter/material.dart';
import 'package:getstore/Pages/NewHome.dart';
class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(),
            Text('Title:'),
            Text('Price:'),
            Text('Category:'),
            Text('Description:'),


          ],
        ),
      ),
    );
  }
}
