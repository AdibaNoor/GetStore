import 'package:flutter/material.dart';
import 'package:getstore/Pages/LoginPage.dart';
import 'package:getstore/Pages/NewHome.dart';
import 'package:getstore/Utils/constants.dart';

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
    return Scaffold(
      backgroundColor: Color(0xff222b12),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("GetStore", style: TextStyle(fontSize: 34,color: Color(0xfffbefe3)),),
            Icon(Icons.shopping_cart,size: 100,color: Color(0xfffbefe3),),
          ],
        ),
      )

    );
  }
}
