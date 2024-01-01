import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:organisation_tache/controllers/sign_in_controller.dart';
import 'package:organisation_tache/widgets/constance.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.lable,
    required this.onPressed,
  });
  final String lable;
  final Function onPressed;

  final LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor, // Background color
        foregroundColor: Colors.white, // Text color
        elevation: 4, // Elevation (shadow)
        padding: const EdgeInsets.symmetric(
            horizontal: 130, vertical: 12), // Ajustez la hauteur verticale ici
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Border radius
        ),
      ),
      onPressed: () {
        onPressed();
      },
      child: Obx(() => loginController.isSigningIn.value
          ? const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Center(
              child: Text(lable),
            )),
    );
  }
}
