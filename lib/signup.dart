import 'package:flutter/material.dart';
import 'package:food_order/restaurant/restsignup.dart';
import 'package:food_order/user/usersignup.dart';
import 'package:food_order/widget/customTextField.dart';
import 'package:food_order/widget/custombutton.dart';

enum Usertype { restaurant, user }

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool checkValue1 = false;
  bool checkValue2 = false;
  Usertype type = Usertype.user;
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
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(height: 30),
                Text(
                  "Welcome to Order",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Before we get you signed in",
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(height: 20),
                Text("Do you wish to sign in as a :"),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  "Restaurant",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width: 10),
                                    Checkbox(
                                      value: checkValue1,
                                      onChanged: (value) {
                                        setState(() {
                                          checkValue2 = false;
                                          checkValue1 = !checkValue1;
                                          type = Usertype.restaurant;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  "user",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width: 10),
                                    Checkbox(
                                      value: checkValue2,
                                      onChanged: (value) {
                                        setState(() {
                                          checkValue2 = !checkValue2;
                                          checkValue1 = false;
                                          type = Usertype.user;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Row(
                //   children: [
                //     Text("Already have an account with us"),
                //     Text("Sign in")
                //   ],
                // ),
                Spacer(),
                Custombutton(
                  text: "Next",
                  onPressed: () {
                    if (type == Usertype.user) {
                      //User signup
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserSignUp()));
                      print("user");
                    } else {
                      //Restaurant signup
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => RestSignUp()));
                      print("Restaurant");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
