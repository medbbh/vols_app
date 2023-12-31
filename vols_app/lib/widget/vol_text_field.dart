import 'package:flutter/material.dart';

class VolTextField extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;


  VolTextField({super.key, this.label, this.controller});

  @override
  State<VolTextField> createState() => _VolTextFieldState();
}

class _VolTextFieldState extends State<VolTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: const TextStyle(color: Colors.white),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
