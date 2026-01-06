import 'package:flutter/material.dart';
import 'package:food_order/signup.dart';
import 'package:food_order/user/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Startpage extends StatefulWidget {
  const Startpage({super.key});

  @override
  State<Startpage> createState() => _StartpageState();
}

class _StartpageState extends State<Startpage> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), (){check();});
    super.initState();
  }

  void check()async{
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("userId");
    if (userId == null || userId == "") {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignUpPage()));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Homepage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.white, Colors.white,Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.food_bank_outlined,size: 180,color: Colors.green,),
              SizedBox(height: 10),
              Text("Order",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.green),),
              SizedBox(height: 10),
              CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
