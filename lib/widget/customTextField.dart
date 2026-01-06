import 'package:flutter/material.dart';

class Customtextfield extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final String? text;
  final bool? isPassword;
  const Customtextfield({
    super.key,
    required this.controller,
    this.hintText,
    this.text = "",
    this.isPassword = false,
    this.validator,
  });

  @override
  State<Customtextfield> createState() => _CustomtextfieldState();
}

class _CustomtextfieldState extends State<Customtextfield> {

  bool showpassword = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity, child: TextFormField(
        // maxLines: widget.maxLine,
        validator: widget.validator,
        obscuringCharacter: "*",
        obscureText: widget.isPassword! ? !showpassword : false,
        controller: widget.controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          suffix: widget.isPassword!
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showpassword = !showpassword;
                    });
                  },
                  icon: Icon(
                    showpassword ? Icons.visibility_off : Icons.visibility,
                  ),
                )
              : null,
          label: Text(widget.text!),
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          )
        ),
      ),
    );
  }
}
