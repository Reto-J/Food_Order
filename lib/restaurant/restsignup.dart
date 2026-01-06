import 'package:flutter/material.dart';
import 'package:food_order/restaurant/restOTP.dart';
import 'package:food_order/restaurant/restsignin.dart';
import 'package:food_order/widget/customTextField.dart';
import 'package:food_order/widget/custombutton.dart';
import 'package:food_order/widget/multilieTextfield.dart';

class RestSignUp extends StatefulWidget {
  const RestSignUp({super.key});

  @override
  State<RestSignUp> createState() => _RestSignUpState();
}

class _RestSignUpState extends State<RestSignUp> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void next(){
    if (formKey.currentState!.validate()) {
      //Send email to get varification otp
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RestOTP()));
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
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios)),
                      Icon(Icons.food_bank_outlined)
                    ],
                  ),
                  SizedBox(height: 20),
                  Text("Okay please fill in the following to continue", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  SizedBox(height: 20),
                  Text("Name of restaurant",style: TextStyle(fontWeight: FontWeight.bold),),
                  Customtextfield(controller: nameController, hintText: "Tasty Food",validator: (value) {
                    if (value!.length < 3) {
                      return "Name can't br less than three characters";
                    } else {
                      return null;
                    }
                  },),
                  SizedBox(height: 20),
                  Text("Email the restaurant will be using",style: TextStyle(fontWeight: FontWeight.bold)),
                  Customtextfield(controller: emailController, hintText: "example1@gmail.com",validator: (value) {
                     var regex = RegExp(r"[a-z]+[0-9]*@[a-z]+\.[a-z]");
                  if (regex.hasMatch(value!)) {
                    return null;
                  } else {
                    return "Invalid email format";
                  }
                  }),
                  SizedBox(height: 20),
                  Text("Enter description",style: TextStyle(fontWeight: FontWeight.bold)),
                  MulitlineTextField(controller: descriptionController, maxLine: 4),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text("Your restaurant is registered",style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 5),
                      GestureDetector(onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RestSignIn()));
                      },child: Text("Sign in",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)))
                    ],
                  ),
                  Spacer(),
                  Custombutton(text: "Next", onPressed: (){next();})
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}