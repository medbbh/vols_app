import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../app_constants.dart';
import '../config.dart';
import '../controllers/auth_controller.dart';
import '../services/firebase_service.dart';
import '../utils.dart';
import '../widget/my_button.dart';
import '../widget/my_text_filed.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final AuthController _authController = Get.put(AuthController());
  final FirebaseService _firebaseService = FirebaseService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                Stack(
                  children: [
                    const Text(
                      'Inscription',
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
                const MyTextFiled(
                  label: 'Nom',
                ),
                SizedBox(height: fullHeight(context) * 0.03),
                MyTextFiled(
                    label: 'Email',
                    controller: _authController.emailController),
                SizedBox(height: fullHeight(context) * 0.03),
                MyTextFiled(
                    label: 'Mot de passe',
                    controller: _authController.passwordController),
                SizedBox(height: fullHeight(context) * 0.06),
                Obx(
                  () => _authController.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : Center(
                          child: MyButton(
                              onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _authController.setIsLoading(true);
                              var loginResult = await _firebaseService.signUp(
                                  _authController.emailController.text,
                                  _authController.passwordController.text);
                              _authController.setIsLoading(false);
                              if (loginResult == true) {
                                Get.off(LoginScreen());
                              } else {
                                showSnackbarError('Login failed !');
                              }
                            }
                          },
                              title: "S'inscrire"),
                        ),
                ),
                SizedBox(height: fullHeight(context) * 0.02),
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(width: fullHeight(context) * 0.1),

                    const Text(
                      "Vous avez deja un compte? ",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                          onTap: () => Get.to(LoginScreen()),
                          child: const Text('Connectez-ici',
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
