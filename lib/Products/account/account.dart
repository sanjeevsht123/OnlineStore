import 'package:flutter/material.dart';

class Account_screen extends StatelessWidget {
  const Account_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),body: Container(
        child: Text("Account"),
        alignment: Alignment.center,
      ),
    );
  }
}