import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vols_app/app_constants.dart';

import '../models/vols_model.dart';
import '../widget/app_bar.dart';

class VolsSearchNotFound extends StatefulWidget {
  final Vols vol;
  const VolsSearchNotFound({
    super.key,
    required this.vol,
  });

  @override
  State<VolsSearchNotFound> createState() => _VolsSearchNotFoundState();
}

class _VolsSearchNotFoundState extends State<VolsSearchNotFound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight * 4.5),
          child: AppBar(
            titleSpacing: 0,
            flexibleSpace: const MyAppBar(text: 'Votre voyage'),
          )),
      body: Column(
        children: [
          Container(
            child: Row(children: [
              Text(widget.vol.from),
              const Icon(
                FontAwesomeIcons.plane,
                color: AppConstants.primaryColor,
              ),
              Text(widget.vol.to),
            ]),
          )
        ],
      ),
    );
  }
}
