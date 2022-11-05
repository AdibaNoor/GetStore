import 'package:flutter/material.dart';
import 'package:getstore/Pages/LoginPage.dart';
import 'package:getstore/Pages/NewHome.dart';


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
            Text("GetStore", style: TextStyle(fontSize: 34,color: Color(0xfff3ece1),fontWeight: FontWeight.bold),),
            Icon(Icons.shopping_cart,size: 120,color: Color(0xfff3ece1),),
          ],
        ),
      )

    );
  }
}
