import 'package:flutter/material.dart';
import 'package:getstore/Pages/NewHome.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome!',style: TextStyle(fontSize: 30,color: Color(0xff222b12),fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xfff3ece1),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        cursorColor: Colors.black87,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Color(0xff222b12),fontWeight: FontWeight.bold),
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.email_outlined,color: Color(0xff222b12),),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,),
                      child: TextFormField(
                        cursorColor: Colors.black87,
                        keyboardType: TextInputType.emailAddress,
                        obscuringCharacter: '*',
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Color(0xff222b12),fontWeight: FontWeight.bold,),
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock, color: Color(0xff222b12),),
                        ),
                      ),
                    ),
                   InkWell(
                     onTap: (){
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> NewHomePage()));
                     },
                     child: Container(
                       padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                       decoration: BoxDecoration(
                         color: Color(0xff222b12),
                         borderRadius: BorderRadius.circular(15),
                       ),

                       child: Text('Login', style: TextStyle(
                         color: Color(0xfff3ece1),
                         fontSize: 20
                       ),),
                     ),
                   )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
