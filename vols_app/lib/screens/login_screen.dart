import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:vols_app/screens/home_screen.dart';

import '../app_constants.dart';
import '../config.dart';
import '../controllers/auth_controller.dart';
import '../services/firebase_service.dart';
import '../utils.dart';
import '../widget/my_button.dart';
import '../widget/my_text_filed.dart';
import 'register_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  
  final AuthController _authController = Get.put(AuthController());
  final FirebaseService _firebaseService = FirebaseService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: AppBar().preferredSize.height * 2),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Transform.rotate(
                    angle: 100,
                    child: const Icon(
                      FontAwesomeIcons.plane,
                      size: 50,
                    ),
                  ),
                ),
                SizedBox(height: fullHeight(context) * 0.02),
                Stack(
                  children: [
                    const Text(
                      'Connexion',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: fullHeight(context) * 0.07),
                    Positioned(
                      left: 5,
                      bottom: 2,
                      child: Container(
                        alignment: Alignment.topLeft,
                        height: 3.0, // Adjust the height of the border here
                        width: 94.0, // Adjust the width of the border here
                        color:
                            Colors.black, // Adjust the color of the border here
                      ),
                    ),
                  ],
                ),
                SizedBox(height: fullHeight(context) * 0.04),
                MyTextFiled(
                  label: 'Email',
                  controller: _authController.emailController,
                ),
                SizedBox(height: fullHeight(context) * 0.03),
                MyTextFiled(
                  obscureText: true,
                  label: 'Mot de passe',
                  controller: _authController.passwordController,
                ),
                SizedBox(height: fullHeight(context) * 0.09),
                Obx(() => _authController.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : Center(
                        child: MyButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _authController.setIsLoading(true);
                            var loginResult = await _firebaseService.login(
                                _authController.emailController.text,
                                _authController.passwordController.text);
                            if (loginResult == true) {
                              _authController.setIsLoading(false);
                              Get.to(HomeScreen());
                            } else {
                              _authController.setIsLoading(false);
                              showSnackbarError('Login failed !');
                            }
                          }
                        },
                            title: "Se Connecter"),
                      )),
                SizedBox(height: fullHeight(context) * 0.03),
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(width: fullHeight(context) * 0.1),

                    const Text(
                      "Vous n'avez pas de compte? ",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                          onTap: () => Get.to(SignUpScreen()),
                          child: const Text('Inscrivez-vous ici',
                              style: TextStyle(
                                  color: AppConstants.primaryColor,
                                  fontWeight: FontWeight.w700))),
                    )
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
