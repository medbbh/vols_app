import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vols_app/screens/hotel_screen.dart';
import 'package:vols_app/screens/vol_screen.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;

  List<Widget> pages = [const VolScreen(), const HotelScreen()];

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
