import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_order/restaurant/restsignup.dart';
import 'package:food_order/user/usersignup.dart';
import 'package:food_order/widget/custombutton.dart';
import 'package:food_order/widget/glitter_confetti.dart';

enum Usertype { restaurant, user }

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    _confettiController = ConfettiController(
      duration: Duration(milliseconds: 200),
    );
    super.initState();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void onPressed() {
    HapticFeedback.mediumImpact();
    _confettiController.play();
  }

  bool isResturant = false;
  Usertype type = Usertype.user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.green,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(11, 200, 11, 20),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Text(
                      "Welcome to Order",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
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
                            child: SizedBox(
                              height: 100,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isResturant = true;
                                  });
                                  onPressed();
                                },
                                child: Card(
                                  elevation: isResturant ? 9 : 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: isResturant == true
                                        ? BorderSide(
                                            color: Colors.green,
                                            width: 3,
                                          )
                                        : BorderSide(style: BorderStyle.none),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Restaurant",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 100,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isResturant = false;
                                  });
                                  onPressed();
                                },
                                child: Card(
                                  elevation: !isResturant ? 9 : 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: isResturant == false
                                        ? BorderSide(
                                            color: Colors.green,
                                            width: 3,
                                          )
                                        : BorderSide(style: BorderStyle.none),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "user",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
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
                        HapticFeedback.mediumImpact();
                        if (!isResturant) {
                          //User signup
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => UserSignUp(),
                            ),
                          );
                          print("user");
                        } else {
                          //Restaurant signup
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => RestSignUp(),
                            ),
                          );
                          print("Restaurant");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 200,
            left: 90,
            right: 90,
            child: GlitterConfetti(
              controller: _confettiController,
              colors: [Colors.green, Colors.lightGreen],
            ),
          ),
        ],
      ),
    );
  }
}
