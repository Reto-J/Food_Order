import 'package:flutter/material.dart';
import 'package:food_order/helper/serverHelper.dart';
import 'package:food_order/toastification/error.dart';
import 'package:food_order/toastification/sucess.dart';
import 'package:food_order/user/homepage.dart';
import 'package:food_order/user/usersignup.dart';
import 'package:food_order/widget/customTextField.dart';
import 'package:food_order/widget/custombutton.dart';

class UserSignin extends StatefulWidget {
  const UserSignin({super.key});

  @override
  State<UserSignin> createState() => _UserSigninState();
}

class _UserSigninState extends State<UserSignin> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login()async{
    //Login function

    try {
          int ty = await ServerHelper().logUserIn(emailController.text, passwordController.text);

    if (ty == 200) {
      showSucessMessage(context, "Login Sucessful 👍👍👍");
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Homepage()));
    } else{
      showErrorMessage(context, "Email or Password incorect");
    }

    } catch (e) {
      print("-------------------------${e}------------------");
    }
    
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
                Text("Welcome back !!!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                SizedBox(height: 15),
                Text("But before you can continue please fill in your details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                SizedBox(height: 20),
                Customtextfield(controller: emailController, text: "Email"),
                SizedBox(height: 20),
                Customtextfield(controller: passwordController, text: "Password",),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text("Don't have an account",style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 5),
                    GestureDetector(onTap:() => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => UserSignUp())),child: Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),)
                  ],
                ),
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