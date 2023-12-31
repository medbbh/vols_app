import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vols_app/app_constants.dart';
import 'package:vols_app/config.dart';
import 'package:vols_app/controllers/vols_controller.dart';
import 'package:vols_app/models/vols_model.dart';
import 'package:vols_app/screens/login_screen.dart';
import 'package:vols_app/screens/register_screen.dart';
import 'package:vols_app/screens/vols_result_screen.dart';
import 'package:vols_app/widget/my_button.dart';

import '../widget/dropdown_button.dart';
import '../widget/vol_text_field.dart';
import 'vols_search_not_found.dart';

class VolScreen extends StatefulWidget {
  const VolScreen({Key? key}) : super(key: key);

  @override
  _VolScreenState createState() => _VolScreenState();
}

class _VolScreenState extends State<VolScreen> {
  DateTime? selectedDate;

  final VolsController _volsController = Get.put(VolsController());
  TextEditingController dateController = TextEditingController();
  TextEditingController _from = TextEditingController();
  TextEditingController _to = TextEditingController();
  TextEditingController _passangers = TextEditingController();
  DateTime? _date;
  String? _type;
  String? _classe;

  void typeDropDown(String? value) {
    // Do something with the selected value
    _type = value;
  }

  void classeDropDown(String? value) {
    // Do something with the selected value
    _classe = value;
  }

  Future<void> searchVols(String from, String to, DateTime date, String type,
      String passangers, String classe) async {
    final VolsController _volsController = Get.find<VolsController>();
    _volsController.setIsLoading(true);

    try {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firebaseFirestore
              .collection('vols')
              .where('from', isEqualTo: from)
              .where('to', isEqualTo: to)
              .where('date', isEqualTo: date)
              .where('type', isEqualTo: type)
              .where('passangers', isEqualTo: passangers)
              .where('classe', isEqualTo: classe)
              .get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot
          in querySnapshot.docs) {
        Map<String, dynamic> data = documentSnapshot.data();

        Vols vol = Vols(
            from: data['from'] ?? '',
            to: data['to'] ?? '',
            date: data['date'] ?? '',
            type: data['type'] ?? '',
            passangers: data['passangers'] ?? '',
            classe: data['classe'] ?? '');
        _volsController.addVols(vol);
      }
      ;

      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        if (_volsController.vols.isNotEmpty) {
          return VolsSearchScreen(vol:_volsController.vols.first);
        } else {
          return VolsSearchNotFound(vol:_volsController.vols.first);
        }
      }));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.topCenter,
        width: fullWidth(context),
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
            color: AppConstants.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            Row(
              children: [
                VolTextField(
                  controller: _from,
                  label: "A partir de",
                ),
                const SizedBox(width: 50),
                VolTextField(
                  controller: _to,
                  label: "A",
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                  width: 130,
                  child: DateTimeField(
                    dateFormat: DateFormat('dd MM yyyy'),
                    mode: DateTimeFieldPickerMode.date,
                    decoration: const InputDecoration(
                        labelText: 'Date',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        )),
                    selectedDate: selectedDate,
                    onDateSelected: (DateTime value) {
                      setState(() {
                        selectedDate = value;
                        _date = value;
                      });
                    },
                    dateTextStyle: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 50),
                SizedBox(
                    width: 130,
                    child: DropdownButtonExample(
                      onValueChanged: typeDropDown,
                      label: "Type",
                      options: const ["One Way", "Round-Trip", "Multi-city"],
                    )),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                VolTextField(
                  controller: _passangers,
                  label: "Passagers",
                ),
                const SizedBox(width: 50),
                SizedBox(
                    width: 130,
                    child: DropdownButtonExample(
                      onValueChanged: classeDropDown,
                      label: "Classe",
                      options: const ["Economy", "First class", "Business"],
                    )),
              ],
            ),
          ],
        ),
      ),
      SizedBox(
        height: fullHeight(context) * 0.04,
      ),
      MyButton(
        title: 'Recherche',
        color: AppConstants.primaryColor,
        onPressed: () {
          if (_date != null && _type != null && _classe != null) {
            searchVols(_from.text, _to.text, _date!, _type!, _passangers.text,
                _classe!);
          } else {
            print("wrong");
          }
        },
      )
    ]);
  }
}
