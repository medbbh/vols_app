import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:vols_app/app_constants.dart';
import 'package:vols_app/config.dart';

import '../models/vols_model.dart';
import '../widget/app_bar.dart';

class VolsSearchNotFound extends StatefulWidget {
  final Vols? vol;
  const VolsSearchNotFound({
    super.key,
    this.vol,
  });

  @override
  State<VolsSearchNotFound> createState() => _VolsSearchNotFoundState();
}

class _VolsSearchNotFoundState extends State<VolsSearchNotFound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight * 3.5),
          child: AppBar(
            titleSpacing: 0,
            flexibleSpace: const MyAppBar(text: 'Resulats de recherche'),
          )),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Row(children: [
              SizedBox(width: 60),
              const Text(
                'London',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 60),
              Icon(
                FontAwesomeIcons.plane,
                color: AppConstants.primaryColor,
                size: 30,
              ),
              SizedBox(width: 60),
              Text(
                'Berlin',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          SizedBox(height: fullHeight(context) * 0.2),
          const Icon(
            Icons.error,
            color: Colors.red,
            size: 50,
          ),
          const SizedBox(height: 10),
          const Text(
            "Il n'ya aucun vol trouve ce jour",
            style: TextStyle(
                fontSize: 25, color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
