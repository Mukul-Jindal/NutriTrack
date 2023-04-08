// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({
    required this.imagePath,
    super.key,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color.fromRGBO(255, 248, 238, 1),
          borderRadius: BorderRadius.circular(16)),
      child: Image.asset(imagePath),
    );
  }
}
