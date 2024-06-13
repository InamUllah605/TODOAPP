import 'package:flutter/material.dart';

class Txtformfield extends StatelessWidget {
  String text;
  TextEditingController controller;
  Txtformfield({super.key,
    this.text="",
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 50,width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 30),
            border: InputBorder.none,
            labelText: text,labelStyle: TextStyle(color: Colors.black38),
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
