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
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(child: Icon(Icons.person,size: 100,),),
              Text('Title:',style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Price:',style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Category:',style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Description:',style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
        ),

    );
  }
}
