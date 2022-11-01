import 'package:flutter/material.dart';
import 'package:getstore/Pages/HomePage.dart';
import 'package:getstore/Pages/LoginPage.dart';
import 'package:getstore/Utils/routes_name.dart';

class Routes{
  static Route<dynamic>  generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteNames.home:
        return MaterialPageRoute(builder: (context)=> HomePage());
      case RouteNames.login:
        return MaterialPageRoute(builder: (context)=> LoginPage());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text('No route Defined'),
            ),
          );
        });
    }
  }
}