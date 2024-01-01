import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organisation_tache/controllers/sign_in_controller.dart';
import 'package:organisation_tache/screens/homepage.dart';
import 'package:organisation_tache/widgets/constance.dart';
import 'package:organisation_tache/widgets/custom_button_widget.dart';
import 'package:organisation_tache/widgets/custom_text.dart';
import 'package:organisation_tache/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class SignIn extends StatelessWidget {
  SignIn({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginController loginController = Get.put(LoginController());
  bool rememberPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 90,
            right: 20,
            left: 20,
          ),
          child: Column(
            children: [
              const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '     E-mail',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomField(
                    controller: emailController,
                    label: "Enter your email",
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '    Password',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomField(
                    controller: passwordController,
                    label: "Enter your password",
                    isPassword: true,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: rememberPassword,
                        onChanged: (value) {},
                        activeColor: lightBlueColor,
                      ),
                      const Text(
                        'Remember Password?',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  CustomText(
                    text: 'Forgot Password?',
                    fontSize: 14,
                    alignment: Alignment.topRight,
                    color: lightBlueColor,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              CustomButton(
                lable: "Sign In",
                //labele: "Connexion",
                onPressed: () async {
                  try {
                    String email = emailController.text.trim();
                    String password = passwordController.text;
                    String result =
                        await loginController.login(email, password);
                    if (result.isNotEmpty) {
                      Get.snackbar(
                        "Connexion réussie",
                        "Bienvenu ",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: primaryColor,
                        colorText: Colors.white,
                        duration: Duration(seconds: 3),
                        boxShadows: [
                          BoxShadow(
                            offset: const Offset(4, 0),
                            blurRadius: 16,
                            color: Colors.grey[300]!,
                          )
                        ],
                      );
                      Get.to(() => HomePage());
                    }
                  } catch (e) {
                    // Gérer toute exception imprévue ici
                    print('Login Error: $e');
                    Get.snackbar(
                      "Erreur de connexion",
                      "Une erreur inattendue s'est produite",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                      duration: Duration(seconds: 3),
                      boxShadows: [
                        BoxShadow(
                          offset: const Offset(4, 0),
                          blurRadius: 16,
                          color: Colors.grey[300]!,
                        )
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
