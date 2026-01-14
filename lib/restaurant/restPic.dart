import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_order/helper/serverHelper.dart';
import 'package:food_order/restaurant/restHomPage.dart';
import 'package:food_order/toastification/error.dart';
import 'package:food_order/toastification/sucess.dart';
import 'package:food_order/widget/custombutton.dart';
import 'package:image_picker/image_picker.dart';

class RestPic extends StatefulWidget {
  const RestPic({super.key});

  @override
  State<RestPic> createState() => _RestPicState();
}

class _RestPicState extends State<RestPic> {

  void addPIc()async{
    try {
      
  bool sucessful =  await ServerHelper().updateUser({"image" : base64Image});

  if (sucessful) {
    showSucessMessage(context, "Image added sucessfully");
  } else {
    showErrorMessage(context, "Something went wrong");
  }

    } catch (e) {
      print(e);
    }
  }


  String? base64Image;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    final bytes = await File(image.path).readAsBytes();
    setState(() {
      base64Image = base64Encode(bytes);
    });
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 40, 15, 15),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Add a picture your restaurant",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: pickImage,
                  child: Container(
                    width: 190,
                    height: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[300],
                      border: Border.all(color: Colors.grey),
                    ),
                    child: base64Image == null
                        ? const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add_a_photo, size: 40),
                                SizedBox(height: 8),
                                Text("Tap to choose image"),
                              ],
                            ),
                          )
                        : ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                            child: Image.memory(
                              base64Decode(base64Image!),
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: Custombutton(text: "Add", onPressed: () {addPIc();}),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Custombutton(
                        text: "Skip",
                        onPressed: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RestHomPage()));},
                        brColor: Colors.white,
                        fgColor: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
