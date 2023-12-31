import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:vols_app/app_constants.dart';
import 'package:vols_app/config.dart';
import 'package:vols_app/controllers/home_controller.dart';
import 'package:vols_app/screens/hotel_screen.dart';
import 'package:vols_app/screens/vol_screen.dart';
import 'package:vols_app/widget/app_bar.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  final List<Widget> _tabs = [
    const VolScreen(),
    const HotelScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight * 4.5),
          child: AppBar(
            titleSpacing: 0,
            flexibleSpace: const MyAppBar(text: 'Votre voyage'),
            bottom: TabBar(
              indicator: const UnderlineTabIndicator(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide:
                      BorderSide(width: 4.0, color: AppConstants.primaryColor),
                  insets: EdgeInsets.symmetric(horizontal: 30.0)),
              indicatorColor: AppConstants.primaryColor,
              dividerColor: Colors.white,
              labelColor: Colors.black,
              padding:
                  EdgeInsets.symmetric(horizontal: fullWidth(context) * 0.01),
              tabs: [
                Tab(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Transform.rotate(
                        angle: 100,
                        child: const Icon(
                          FontAwesomeIcons.plane,
                          size: 25,
                        ),
                      ),
                      SizedBox(width: fullWidth(context) * 0.02),
                      const Text(
                        'Vol',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ])),
                Tab(
                    child: Container(
                        margin: const EdgeInsets.only(left: 30),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(FontAwesomeIcons.hotel),
                              SizedBox(width: fullWidth(context) * 0.02),
                              const Text(
                                'Hotel',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ]))),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: TabBarView(
            children: _tabs,
          ),
        ),
      ),
    );
  }
}
