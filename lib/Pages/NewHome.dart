import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getstore/Models/ProductModel.dart';
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
      for(Map u in jsonData){
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
        title: Text('Home Page'),
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
                    return Card(
                      elevation: 2,
                      color: Colors.white38,
                      child: Column(
                        children: [
                          Text(productslist[index].title.toString()),
                        ],
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
