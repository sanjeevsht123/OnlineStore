import 'package:flutter/material.dart';

class circular_widget extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const circular_widget({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.orangeAccent
        ),
        alignment: Alignment.center,
        child: Text(text,style: TextStyle(
          fontSize: 20,
          color: Colors.white
        ),),
      ),
    );
  }
}