import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RestProfile extends StatefulWidget {
  const RestProfile({super.key});

  @override
  State<RestProfile> createState() => _RestProfileState();
}

class _RestProfileState extends State<RestProfile> {

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
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 50, 15, 15),
          child: Column(
            children: [
              SizedBox(height: 40),
              GestureDetector(
                  onTap: pickImage,
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
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
                        : ClipOval(
                            child: Image.memory(
                              base64Decode(base64Image!),
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}