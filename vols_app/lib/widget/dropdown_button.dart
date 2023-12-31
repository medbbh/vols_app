import 'package:flutter/material.dart';

class DropdownButtonExample extends StatefulWidget {
  final List<String>? options;
  final String? label;
  final TextEditingController? controller;
  final Function(String?)? onValueChanged;

  DropdownButtonExample({super.key, this.options,this.label,this.controller, this.onValueChanged});
  
  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      
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
      value: selectedValue,
      icon: const Icon(
        Icons.keyboard_arrow_down_outlined,
        color: Colors.white,
      ),
      elevation: 0,
      style: const TextStyle(color: Colors.white),
      onChanged: (String? value) {
        setState(() {
          selectedValue = value;     
          // Call the callback function with the selected value
          widget.onValueChanged?.call(value);     
        });
      },
      items: widget.options!.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        );
      }).toList(),
    );
  }
}
