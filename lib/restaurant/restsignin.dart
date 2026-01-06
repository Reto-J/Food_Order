import 'package:flutter/material.dart';
import 'package:food_order/restaurant/restHomPage.dart';
import 'package:food_order/widget/customTextField.dart';
import 'package:food_order/widget/custombutton.dart';

class RestSignIn extends StatefulWidget {
  const RestSignIn({super.key});

  @override
  State<RestSignIn> createState() => _RestSignInState();
}

class _RestSignInState extends State<RestSignIn> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(){
    //login function
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RestHomPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.white, Colors.white, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                Text("Welcome back !!!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                SizedBox(height: 10),
                Text("Before you continue please fill in your restaurants details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                SizedBox(height: 20),
                Customtextfield(controller: emailController, text: "Email",),
                SizedBox(height: 20),
                Customtextfield(controller: passwordController, text: "Password",isPassword: true,),
                Spacer(),
                Custombutton(text: "Log In", onPressed: (){login();})
              ],
            ),
          ),
        ),
      ),
    );
  }
}