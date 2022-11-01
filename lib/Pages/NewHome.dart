import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getstore/Models/ProductsModel.dart';
import 'package:http/http.dart' as http;
class NewHomePage extends StatefulWidget {
  const NewHomePage({Key? key}) : super(key: key);

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  Future<List<ProductModel>> getData() async{
    var response = await http.get(Uri.https('fakestoreapi.com','products'));
    var jsonData = jsonDecode(response.body);
    List<ProductModel> productslist = [];
    for(var u in jsonData){
      // ProductModel products = ProductModel(title: '');
      // productslist.add(products);
      productslist.add(u);
    }
    print("vhghjbj");
    return productslist;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        child: Card(
          child: FutureBuilder(
            future: getData(),
            builder: (context,AsyncSnapshot snapshot){
              if(snapshot.data == null){
                return Container(
                  child: Center(
                    child: Text('sfcjn'),
                  ),
                );
              }else return ListView.builder(
                itemCount: snapshot.data.length,
                  itemBuilder: (context,index){
                  return ListTile(
                    title: Text(snapshot.data[index].title),
                  );
                  });
            },
          ),
        ),
      ),
    );
  }
}
