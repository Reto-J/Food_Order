import 'package:flutter/material.dart';

class MulitlineTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final String? text;
  final int maxLine;
  const MulitlineTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.text = "",
    this.validator, 
    required this.maxLine,
  });

  @override
  State<MulitlineTextField> createState() => _MulitlineTextFieldState();
}

class _MulitlineTextFieldState extends State<MulitlineTextField> {


  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity, child: TextFormField(
        maxLines: widget.maxLine,
        validator: widget.validator,
        controller: widget.controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
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
