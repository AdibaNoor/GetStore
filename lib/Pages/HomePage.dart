import 'dart:convert';
import 'package:getstore/data/status.dart';
import 'package:flutter/material.dart';
import 'package:getstore/Models/ProductModel.dart';
import 'package:getstore/View_Model/home_view_model.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeViewViewModel homeViewViewModel = HomeViewViewModel();
  void initState(){
    homeViewViewModel.fetchProduct();
    super.initState();
  }
  // List<ProductModel> productlist = [];

  Future<ProductModel> getProductApi() async{
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      return ProductModel.fromJson(data);
      // for( Map i in data){
      //   productlist.add(ProductModel.fromJson(i));
      // }
      // return productlist;
    }else{
      return ProductModel.fromJson(data);
      // return productlist;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetStore'),
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) => homeViewViewModel,
        child: Consumer<HomeViewViewModel>(
          builder: (context, value, _){
            switch(value.productlist.status){
              case Status.LOADING:
                return CircularProgressIndicator();
              case Status.ERROR:
                return ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context,index){
                      return Card(
                        child: ListTile(
                          title: Text(value.productlist.data!.title.toString()),
                        ),
                      );
                    });
              case Status.COMPLETED:
                return ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context,index){
                      return Card(
                        child: ListTile(
                          title: Text(value.productlist.data!.title.toString()),
                        ),
                      );
                    });
            }
            return Container();
          }
        )
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(25.0),
      //   child: Column(
      //     children: [
      //       Expanded(child: FutureBuilder<ProductModel>(
      //         future: getProductApi(),
      //         builder: (context,snapshot){
      //           if(snapshot.connectionState == ConnectionState.waiting){
      //             return Text('Loading');
      //             // return ListView.builder(
      //             //     itemCount: 20,
      //             //     itemBuilder: (context,index){
      //             //       return Text(snapshot.data!.price.toString());
      //             //     });
      //           }else{
      //             // return Text('Loading');
      //             return ListView.builder(
      //                 itemCount: 20,
      //                 itemBuilder: (context,index){
      //                   return Text(snapshot.data!.price.toString());
      //                 });
      //           }
      //         },
      //       ))
      //     ],
      //   ),
      // )

    );
  }
}
