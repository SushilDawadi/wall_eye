import 'package:flutter/material.dart';

class MyInputField extends StatelessWidget {
  final String msg;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  const MyInputField(
      {super.key,
      required this.msg,
      required this.hintText,
      required this.controller,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0, bottom: 5.0, top: 5.0),
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 160, 160, 147),
          ),
          borderRadius: BorderRadius.circular(10.0)),
      child: Center(
        child: TextFormField(
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter $msg";
            }
          },
          obscureText: obscureText,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Color.fromARGB(211, 142, 137, 137),
              )),
        ),
      ),
    );
  }
}
