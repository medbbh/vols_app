import 'package:cloud_firestore/cloud_firestore.dart';

class Vols {
  String from;
  String to;
  DateTime date;
  String type;
  String passangers;
  String classe;


  Vols({
    required this.from,
    required this.to,
    required this.date,
    required this.type,
    required this.passangers,
    required this.classe,
  });

}

