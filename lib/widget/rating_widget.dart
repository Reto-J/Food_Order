import 'package:flutter/material.dart';

class RatingWidget extends StatefulWidget {
  final double rating;
  const RatingWidget({super.key, this.rating = 0});

  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (widget.rating >= index + 1) {
          return Icon(Icons.star, color: Colors.amber,);
        } else if (widget.rating >= index + 0.5) {
          return Icon(Icons.star_half, color: Colors.amber);
        } else {
          return Icon(Icons.star_border, color: Colors.amber);
        }
      }),
    );
  }
}
