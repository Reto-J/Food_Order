import 'package:flutter/material.dart';
import 'package:food_order/helper/serverHelper.dart';
import 'package:food_order/toastification/error.dart';
import 'package:food_order/toastification/sucess.dart';
import 'package:food_order/user/uesOTP.dart';
import 'package:food_order/user/userSignIn.dart';
import 'package:food_order/widget/customTextField.dart';
import 'package:food_order/widget/custombutton.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserSignUp extends StatefulWidget {
  const UserSignUp({super.key});

  @override
  State<UserSignUp> createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  @override
  void initState() {
    // getLocation();
    super.initState();
  }

  String locationText = "Press the button";
  double long = 0;
  double lat = 0;

  // Future<void> getLocation() async {
  //  try {
  //     // Check permission
  //   LocationPermission permission = await Geolocator.checkPermission();

  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //   }

  //   // if (permission == LocationPermission.deniedForever) {
  //   //   setState(() {
  //   //     locationText = "Location permission denied forever";
  //   //   });
  //   //   return;
  //   // }

  //   // Get position
  //   Position position = await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.high,
  //   );

  //   setState(() {
  //     long = position.longitude;
  //     lat = position.latitude;
  //   });
  //  } catch (e) {
  //    print(e);
  //    showErrorMessage(context, "something went wromg");
  //  }
  // }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void next() async {
    if (formKey.currentState!.validate()) {
      try {
        var ty = await ServerHelper().postUser(
          nameController.text,
          emailController.text,
          "iospxqg7wexqwygw82 3dguygweo 726dwu",
          "Usertype.user",
          passwordController.text,
          long.toString(),
          lat.toString(),
        );

        if (ty == 200) {
          showSucessMessage(context, "User added sucessfully");
        } else {
          showErrorMessage(context, "Something went wrong");
        }
        Navigator.of(
          context,
        ).pushReplacement(MaterialPageRoute(builder: (context) => UseOTP()));
      } catch (e) {
        print(e);
      }
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back_ios_new),
                      ),
                      Icon(Icons.food_bank_outlined),
                    ],
                  ),
                  Text(
                    "Please fill in the following to continue",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Customtextfield(
                    controller: nameController,
                    text: "Name",
                    validator: (value) {
                      if (value!.length < 3) {
                        return "Name can't be less than 3 characters";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  Customtextfield(
                    controller: emailController,
                    text: "Email",
                    validator: (value) {
                      var regex = RegExp(r"[a-z]+[0-9]*@[a-z]+\.[a-z]");
                      if (regex.hasMatch(value!)) {
                        return null;
                      } else {
                        return "Invalid email format";
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  Customtextfield(
                    controller: passwordController,
                    isPassword: true,
                    text: "Password",
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "Already have an account",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => UserSignin(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Custombutton(
                    text: "Next",
                    onPressed: () {
                      next();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
