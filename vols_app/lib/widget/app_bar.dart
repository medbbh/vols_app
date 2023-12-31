import 'package:flutter/material.dart';
import '../app_constants.dart';
// import '../config.dart';

class MyAppBar extends StatefulWidget {
  final Function()? onPressed;
  final String? text;
  const MyAppBar({
    super.key,
    this.onPressed,
    this.text,
  });

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          height: 150.0,
          color: AppConstants.primaryColor,
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Choisissez',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.text!,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ))),
    );
  }
}
