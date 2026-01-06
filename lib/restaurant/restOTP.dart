import 'package:flutter/material.dart';
import 'package:food_order/widget/customTextField.dart';
import 'package:food_order/widget/custombutton.dart';

class RestOTP extends StatefulWidget {
  const RestOTP({super.key});

  @override
  State<RestOTP> createState() => _RestOTPState();
}

class _RestOTPState extends State<RestOTP> {
  @override
  void initState() {
    
    super.initState();
  }

  void confirm(){
    bool test = fiController.text + seController.text + thController.text + foController.text == "1111";
    if (test) {
      //Email verified sucessfuly
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ));
      print("yes");
    }else{
      print("Something went wrong");
    }
  }

  TextEditingController fiController = TextEditingController();
  TextEditingController seController = TextEditingController();
  TextEditingController thController = TextEditingController();
  TextEditingController foController = TextEditingController();

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
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new),
                    ),
                    Icon(Icons.food_bank_outlined),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "To confirm you email a code was sent to exampel1@gmail.com",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("Resend email(0)"),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: Customtextfield(controller: fiController)),
                    SizedBox(width: 10),
                    Expanded(child: Customtextfield(controller: seController)),
                    SizedBox(width: 10),
                    Expanded(child: Customtextfield(controller: thController)),
                    SizedBox(width: 10),
                    Expanded(child: Customtextfield(controller: foController))
                  ]
                ),
                SizedBox(height: 100),
                Custombutton(text: "Confirm", onPressed: (){})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
