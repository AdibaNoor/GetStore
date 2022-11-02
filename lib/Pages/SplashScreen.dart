import 'package:flutter/material.dart';
import 'package:getstore/Pages/LoginPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    _navigatehome();
  }
  _navigatehome() async{
    await Future.delayed(Duration(milliseconds: 2000), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
  }
  @override
  Widget build(BuildContext context) {
    double custom_height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.cyan,
      body:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("GetStore", style: TextStyle(height: 40,color: Colors.black),),
            Icon(Icons.shopping_cart,size: 70,color: Colors.black,),
          ],
        ),

    );
  }
}
