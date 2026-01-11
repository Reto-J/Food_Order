import 'package:flutter/material.dart';
import 'package:food_order/helper/serverHelper.dart';
import 'package:food_order/restaurant/restOTP.dart';
import 'package:food_order/restaurant/restsignin.dart';
import 'package:food_order/toastification/error.dart';
import 'package:food_order/toastification/info.dart';
import 'package:food_order/toastification/sucess.dart';
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
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  double long = 0;
  double lat = 0;

  final formKey = GlobalKey<FormState>();

  void next()async{
    if (formKey.currentState!.validate()) {
      //Send email to get varification otp
      try {
        var ty = await ServerHelper().postUser(
          nameController.text,
          emailController.text,
          "iospxqgwiyypeihaeiorgqegiqur79eiufae3dguygweo 726dwu",
          "Usertype.Restaurant",
          passwordController.text,
          long.toString(),
          lat.toString(),
        );

        if (ty == 200) {
          showSucessMessage(context, "User added sucessfully");
          Navigator.of(context,).pushReplacement(MaterialPageRoute(builder: (context) => RestOTP()));
        } else if(ty == 201) {
          showInfoMessage(context, "User already exists please login");
        }else{
          showErrorMessage(context, "Something went wrong${ty}");
        }
        
      } catch (e) {
        print(e);
      }
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
                  Text("Password",style: TextStyle(fontWeight: FontWeight.bold)),
                  Customtextfield(controller: passwordController,isPassword: true,hintText: "**********",),
                  SizedBox(height: 20),
                  Text("Enter description",style: TextStyle(fontWeight: FontWeight.bold)),
                  MulitlineTextField(controller: descriptionController, maxLine: 4),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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