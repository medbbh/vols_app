import 'package:flutter/material.dart';
import 'package:vols_app/main.dart';
import 'package:vols_app/models/vols_model.dart';
import 'package:vols_app/widget/app_bar.dart';
import '../app_constants.dart';
// import '../config.dart';

class VolsSearchScreen extends StatefulWidget {
  // final Function()? onPressed;
  final Vols vol;
  const VolsSearchScreen({
    super.key,
    // this.onPressed,
    required this.vol,
  });

  @override
  State<VolsSearchScreen> createState() => _VolsSearchScreenState();
}

class _VolsSearchScreenState extends State<VolsSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight * 4.5),
            child: AppBar(
              titleSpacing: 0,
              flexibleSpace: const MyAppBar(text: 'Votre voyage'),
            )),
        body: Center(child: Text(widget.vol.from)));
  }
}
