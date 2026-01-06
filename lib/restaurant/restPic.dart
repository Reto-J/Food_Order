import 'package:flutter/material.dart';
import 'package:food_order/widget/custombutton.dart';

class RestPic extends StatefulWidget {
  const RestPic({super.key});

  @override
  State<RestPic> createState() => _RestPicState();
}

class _RestPicState extends State<RestPic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.white, Colors.white, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Text("Add a picture or iconfor your restaurant",style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 20),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey),
                child: Icon(Icons.image),
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(child: Custombutton(text: "Add", onPressed: (){})),
                  Expanded(child: Custombutton(text: "Skip", onPressed: (){}))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}