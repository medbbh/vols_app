import 'package:flutter/material.dart';

class MyTextFiled extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;
  final bool obscureText;
  const MyTextFiled(
      {super.key, this.label, this.controller, this.obscureText = false});

  @override
  State<MyTextFiled> createState() => _MyTextFiledState();
}

class _MyTextFiledState extends State<MyTextFiled> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(
            fontSize: 20,
            color: Colors.grey,
            fontWeight: FontWeight.w500),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'empty field !';
        }
        return null;
      },
    );
  }
}
