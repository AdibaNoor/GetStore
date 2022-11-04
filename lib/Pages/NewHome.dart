import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getstore/Models/ProductModel.dart';
import 'package:getstore/Pages/LoginPage.dart';
import 'package:getstore/Pages/productDetails.dart';
import 'package:http/http.dart' as http;
class NewHomePage extends StatefulWidget {
  const NewHomePage({Key? key}) : super(key: key);

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  List<ProductModel> productslist = [];
  Future<List<ProductModel>> getData () async{
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    var jsonData = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for(var u in jsonData){
        productslist.add(ProductModel.fromJson(u));
      }
      return productslist;
    }else{
      return productslist;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff222b12),
        centerTitle: true,
        title: Text('GetStore',style: TextStyle(color: Color(0xfffbefe3)),),
      ),
      body: Container(
        child: Card(
          child: Expanded(
            child: FutureBuilder(
              future: getData (),
              builder: (context,AsyncSnapshot snapshot){
                if(snapshot.hasData){
                  return Container(
                    child: Center(
                      child: Text('Loading'),
                    ),
                  );
                }else return ListView.builder(
                  itemCount: productslist.length,
                    itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetails()));
                      },
                      child: Card(
                        elevation: 2,
                        color: Colors.white38,
                        child: Row(
                          children: [
                            Icon(Icons.person),
                            Column(
                              children: [
                                Text('Title:' +productslist[index].title.toString(),),
                                Text('Price:' +productslist[index].price.toString()),
                              ],
                            ),
                          ],
                        )

                      ),
                    );
                    });
              },
            ),
          ),
        ),
      ),
    );
  }
}
